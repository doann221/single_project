import 'package:flutter/material.dart';
import 'package:single_project/page/tabs/authentication_tab/login_tab.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginTap(),
    );
  }
}