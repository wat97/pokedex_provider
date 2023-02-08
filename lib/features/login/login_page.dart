import 'package:pokedex/resources/resources_themes.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:translatebebasan/translatebebasan.dart';

import '../../widget/widget.dart';
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
        runtimeType.toString(),
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
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Column(
            children: [
              const Text("Title"),
              prov.isInit ? contentPage(context, prov) : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget contentPage(BuildContext context, LoginProvider prov) {
    return Expanded(
      child: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          Text(
            'login'.gr,
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
          IntrinsicHeight(
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: prov.size.height * 0.02,
                horizontal: prov.size.width * 0.1,
              ),
              child: Column(
                children: [
                  TextFieldOutlined(
                    controller: prov.controllerUser,
                    enabled: true,
                    colorBackground: Colors.white,
                    borderWidth: BorderWidth.all(5),
                    outlineBorder: Colors.grey,
                    label: 'username'.gr,
                    onChange: (value) => prov.onTextChange(value),
                  ),
                  SizedBox(
                    height: prov.size.height * 0.02,
                  ),
                  TextFieldOutlined(
                    controller: prov.controllerPassword,
                    enabled: true,
                    colorBackground: Colors.white,
                    borderWidth: BorderWidth.all(5),
                    outlineBorder: Colors.grey,
                    label: 'password'.gr,
                    isObsecure: true,
                    floatingText: true,
                    onChange: (value) => prov.onTextChange(value),
                  ),
                  SizedBox(
                    height: prov.size.height * 0.02,
                  ),
                  SizedBox(
                    height: prov.size.height * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Set Prevent click
                      debugPrint(
                          "GestureDetector [${DateTime.now()}] [in OnTap] ${prov.isDisableClick}");
                      prov.onLogin();
                    },
                    child: Container(
                      height: prov.size.height * 0.075,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: prov.isDisableClick ? Colors.grey : Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'login'.gr,
                          style: ResourcesText.bigTextBold
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
