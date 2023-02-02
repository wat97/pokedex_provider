import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'login_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LoginProvider>(context, listen: false).onInit(
        context,
        tag: runtimeType.toString(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<LoginProvider>(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              const Text("Title"),
              contentPage(context, prov),
            ],
          ),
        ),
      ),
    );
  }

  Widget contentPage(BuildContext context, LoginProvider prov) {
    return Expanded(
      child: SizedBox(
        child: Text(prov.cobaExtras),
      ),
    );
  }
}
