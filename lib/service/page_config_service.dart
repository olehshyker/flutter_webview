import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_webview/constants/config.dart';
import '../core/model/page_config.dart';

class PageConfigService {

  Future<PageConfig> getWebPageConfig() async {
    try {
      debugPrint('getWebPageConfig');

      final remoteConfig = FirebaseRemoteConfig.instance;

      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: Duration(seconds: 10),
          minimumFetchInterval: Duration.zero,
        ),
      );

      await remoteConfig.fetchAndActivate();

      // Get and validate the 'url' parameter
      final String remoteUrl = remoteConfig.getString('url').trim();

      debugPrint('getWebPageConfig, got url $remoteUrl');

      final String url = remoteUrl.isNotEmpty ? remoteUrl : Config.fallbackUrl;

      return PageConfig(url: url);
    } catch (e, stackTrace) {
      // Fallback config
      return PageConfig(url: Config.fallbackUrl);
    }
  }



  PageConfig _fromJson(Map<String, dynamic> item) {
    return new PageConfig(
        url: item['url']);
  }
}