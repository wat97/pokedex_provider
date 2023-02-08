import 'package:flutter/material.dart';
import 'package:pokedex/features/dashboard/dashboard.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DashboardProvider>(context, listen: false).onInit(
        context,
        runtimeType.toString(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<DashboardProvider>(context);
    return Scaffold(
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
    );
  }

  Widget contentPage(BuildContext context, DashboardProvider prov) {
    return Expanded(
      child: Container(),
    );
  }
}
