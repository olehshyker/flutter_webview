import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app/app.dart';
import 'injection_container.dart';

void main() {

  final binding = WidgetsFlutterBinding.ensureInitialized();

  init();

  _settingNativeSplash(binding);
  _settingsUI();


  runApp(App());
}

void _settingNativeSplash(WidgetsBinding binding) =>
    FlutterNativeSplash.preserve(widgetsBinding: binding);

void _settingsUI() => SystemChrome.setSystemUIOverlayStyle(
  const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  ),
);