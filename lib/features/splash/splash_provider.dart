import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/custom_core.dart';
import '../../router/router.dart';

class SplashProvider extends CustomCore {
  bool isInitialize = false;
  final double turns = 360;

  late final AnimationController controllerAnimation;

  @override
  void onInit(
    BuildContext context, {
    String? tag,
  }) {
    super.onInit(context, tag: tag);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      debugPrint("splash ${DateTime.now()}");

      await Future.delayed(
        const Duration(
          seconds: 5,
        ),
        () {
          debugPrint("splash ${DateTime.now()}");
          controllerAnimation.dispose();
          context.go(RouterNavigation.routelogin, extra: '123');
        },
      );
    });
  }

  void setAnimation(TickerProvider vsync) async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      controllerAnimation =
          AnimationController(vsync: vsync, duration: Duration(seconds: 2))
            ..repeat();
      isInitialize = true;
      notifyListeners();
    });
  }
}
