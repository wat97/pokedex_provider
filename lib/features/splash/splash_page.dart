import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translatebebasan/translatebebasan.dart';

import 'splash_provider.dart';
import 'dart:math' as math;

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SplashProvider>(context, listen: false).setAnimation(this);
      Provider.of<SplashProvider>(context, listen: false).onInit(
        context,
        tag: runtimeType.toString(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<SplashProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: prov.isInitialize
              ? AnimatedBuilder(
                  animation: prov.controllerAnimation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: prov.controllerAnimation.value * 2 * math.pi,
                      child: child,
                    );
                  },
                  child: Icon(
                    Icons.catching_pokemon,
                    size: size.width * 0.4,
                    color: Colors.green,
                  ),
                )
              : Container(),
        ),
      ),
    );
  }
}
