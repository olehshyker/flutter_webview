import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'home_widget.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  HomeScreen();

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: Text("Flutter-WebView"),
  ),
  body: HomeWebViewWidget(),
  );
  }
}
