import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:translatebebasan/translatebebasan.dart';

import 'lang/language_service.dart';
import 'router/router_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalesBasan().addGlosarium(LanguageService());
  runApp(
    Phoenix(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  late final _route = RouterApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: true,
      routerConfig: _route.router,
    );
  }
}
