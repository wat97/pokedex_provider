import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '../services/services.dart';
import 'interface_core.dart';
import 'provider_core.dart';

class CustomCore extends ProviderCore implements InterfaceCore {
  late BuildContext contextCore;
  late String tagCore;
  bool isInit = false;
  Size get size => MediaQuery.of(contextCore).size;
  @override
  @mustCallSuper
  void onInit(
    BuildContext context,
    String? tag,
  ) {
    contextCore = context;
    tagCore = tag ?? "CustomCore";
    isInit = true;
    notifyListeners();
    debugPrint("CustomCore Tag: $tagCore");
  }

  @override
  void showLoadingProgress(int value, int total) {}

  logOut() {
    ServicesStorage().removeAll();
    Phoenix.rebirth(contextCore);
  }
}
