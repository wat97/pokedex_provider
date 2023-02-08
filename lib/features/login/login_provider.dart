import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/core.dart';
import '../../router/router.dart';

class LoginProvider extends CustomCore {
  String cobaExtras;
  LoginProvider(this.cobaExtras);

  TextEditingController controllerUser = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  bool isDisableClick = true;

  onTextChange(value) async {
    isDisableClick =
        controllerUser.text.isEmpty || controllerPassword.text.isEmpty;
    notifyListeners();
  }

  onLogin() async {
    // if (controllerUser.text.isEmpty || controllerPassword.text.isEmpty) {
    //   return;
    // }
    String userText = controllerUser.text.trim();
    String passText = controllerPassword.text.trim();

    if (userText.toLowerCase() == "admin" &&
        passText.toLowerCase() == "admin") {
      contextCore.go(RouterNavigation.routedashboard);
    }

    notifyListeners();
  }
}
