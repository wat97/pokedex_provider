import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/custom_core.dart';
import '../../router/router.dart';

class SplashProvider extends CustomCore {
  bool isLoading = true;

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
          seconds: 3,
        ),
        () {
          debugPrint("splash ${DateTime.now()}");
          context.go(RouterNavigation.routelogin, extra: '123');
        },
      );
    });
  }
}
