import 'package:flutter/material.dart';

import '../home_screen.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = "settings";

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      title: "Settings",
      body:Container()
    );
  }
}
