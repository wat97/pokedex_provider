import 'package:flutter/material.dart';

import '../../core/core.dart';

class LoginProvider extends CustomCore {
  String cobaExtras;
  LoginProvider(this.cobaExtras);

  TextEditingController controllerUser = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  bool isInit = false;
  bool isDisableClick = true;
  late Size _size;
  Size get size => _size;
  late FocusScopeNode focusNode;

  @override
  void onInit(
    BuildContext context, {
    String? tag,
  }) {
    super.onInit(context, tag: tag);
    _size = MediaQuery.of(context).size;
    isInit = true;
    focusNode = FocusScopeNode();
    notifyListeners();
  }

  onTextChange(value) async {
    isDisableClick =
        controllerUser.text.isEmpty || controllerPassword.text.isEmpty;
    notifyListeners();
  }

  onLogin() async {
    // if (controllerUser.text.isEmpty || controllerPassword.text.isEmpty) {
    //   return;
    // }
    debugPrint("RequestFocust ${focusNode.hasFocus}");
    FocusScope.of(contextCore).setFirstFocus(focusNode);
    FocusScope.of(contextCore).requestFocus(focusNode);
    notifyListeners();
    debugPrint("RequestFocust Akhir ${focusNode.hasFocus}");
  }
}
