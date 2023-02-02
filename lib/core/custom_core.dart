import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '../services/services.dart';
import 'interface_core.dart';
import 'provider_core.dart';

class CustomCore extends ProviderCore implements InterfaceCore {
  late BuildContext contextCore;
  late String tagCore;
  @override
  void onInit(
    BuildContext context, {
    String? tag = "CustomCore",
  }) {
    contextCore = context;
    tagCore = tag!;
    debugPrint("CustomCore Tag: $tagCore");
  }

  @override
  void showLoadingProgress(int value, int total) {
    // TODO: implement showLoadingProgress
  }

  logOut() {
    ServicesStorage().removeAll();
    Phoenix.rebirth(contextCore);
  }
}
