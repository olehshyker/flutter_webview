import 'package:flutter/material.dart';
import 'package:flutter_webview/widgets/load_spinner.dart';
import 'package:flutter_webview/core/theme/app_colors.dart';

import 'load_spinner.dart';

class LoaderOverlay extends StatefulWidget {
  const LoaderOverlay({
    super.key,
    required this.child,
  });

  final Widget child;

  static LoaderOverlayState of(BuildContext context) {
    return context.findAncestorStateOfType<LoaderOverlayState>()!;
  }

  @override
  State<LoaderOverlay> createState() => LoaderOverlayState();
}

class LoaderOverlayState extends State<LoaderOverlay> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _opacityAnimation;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 125),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.child,
        if (_isLoading)
          AnimatedBuilder(
            animation: _animationController,
            builder: (_, child) {
              return Opacity(
                opacity: _opacityAnimation.value,
                child: child,
              );
            },
            child: ModalBarrier(
              color: AppColors.disabledColor.withOpacity(0.6),
              dismissible: false,
            ),
          ),
        if (_isLoading)
          AnimatedBuilder(
            animation: _animationController,
            builder: (_, child) {
              return Opacity(
                opacity: _opacityAnimation.value,
                child: child,
              );
            },
            child: _buildLoadingIndicator(),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: SizedBox(
        width: 64.0,
        height: 64.0,
        child: const LoadSpinner(),
      ),
    );
  }

  void show(bool value) async {
    if (value) {
      if (_isLoading) return;

      setState(() => _isLoading = true);

      await _animationController.forward();
    } else {
      if (!_isLoading) return;

      await _animationController.reverse();

      setState(() => _isLoading = false);
    }
  }
}

extension LoaderOverlayContext on BuildContext {
  LoaderOverlayState get loader => LoaderOverlay.of(this);

  void showLoader(bool value) {
    if (value) FocusManager.instance.primaryFocus?.unfocus();

    loader.show(value);
  }
}
