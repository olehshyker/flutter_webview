import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:flutter_webview/core/theme/app_colors.dart';

class LoadSpinner extends StatelessWidget {
  final Widget? child;

  const LoadSpinner({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        const LoadingIndicator(
          indicatorType: Indicator.ballSpinFadeLoader,
          colors: [
            Colors.white,
            AppColors.primaryColor,
          ],
          strokeWidth: 1,
          backgroundColor: Colors.transparent,
          pathBackgroundColor: Colors.transparent,
        ),
        if (child != null) ...[
          child!,
        ],
      ],
    );
  }
}
