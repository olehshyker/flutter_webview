import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview/service/page_config_service.dart';
import 'package:flutter_webview/widgets/spinner_widget.dart';

import '../../core/model/page_config.dart';

class HomeWebViewWidget extends StatefulWidget {
  const HomeWebViewWidget({super.key});

  @override
  State<HomeWebViewWidget> createState() => _HomeWebViewWidgetState();


}


class _HomeWebViewWidgetState extends State<HomeWebViewWidget> {
  WebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PageConfig>(
      future: PageConfigService().getWebPageConfig(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SpinnerWidget();
        } else if (snapshot.hasError) {
          return const Center(child: Text("Error loading page URL"));
        } else if (!snapshot.hasData || snapshot.data!.url.isEmpty) {
          return const Center(child: Text("No URL found"));
        }

        final String url = snapshot.data!.url;

        _controller = WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageStarted: (url) {},
              onPageFinished: (url) {
                debugPrint('onPageFinished, url: $url');
              },
            ),
          )
          ..loadRequest(Uri.parse(url));

        return PopScope(
          canPop: _controller == null, // allow pop if controller isn't ready
          onPopInvoked: (didPop) async {
            if (didPop) return;

            if (_controller != null && await _controller!.canGoBack()) {
              _controller!.goBack();
            } else {
              SystemNavigator.pop(); // exit app
            }
          },
          child: WebViewWidget(controller: _controller!),
        );
      },
    );
  }
}


