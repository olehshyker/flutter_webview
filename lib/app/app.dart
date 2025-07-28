import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:flutter_webview/core/navigator/app_route.dart';
import 'package:flutter_webview/injection_container.dart';
import 'package:sizer/sizer.dart';

import '../core/theme/app_theme.dart';
import '../widgets/loader_overlay.dart';

class App extends StatefulWidget {
  late final AppRouter appRouter;

  App({Key? key})
      : appRouter = sl.get<AppRouter>(),
        super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Future<void> _onInit() async {
    FlutterNativeSplash.remove();
  }

  @override
  void initState() {
    super.initState();
    _onInit();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: theme,
      home: Sizer(
        builder: (_, __, ___) {
          return MaterialApp.router(
            theme: theme,
            routerDelegate: widget.appRouter.delegate(
              navigatorObservers: () => [HeroController()],
            ),
            routeInformationParser: widget.appRouter.defaultRouteParser(),
            builder: (_, child) {
              return LoaderOverlay(child: child!);
            },
          );
        },
      ),
    );

  }
}
