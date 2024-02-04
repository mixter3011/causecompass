import 'package:causecompass/pages/login_page.dart';
import 'package:causecompass/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // initially, show login page
  bool showLoginPage = true;

  // toggle between login and register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 1000),
      child: showLoginPage
          ? LoginPage(
              key: ValueKey<bool>(showLoginPage),
              onTap: togglePages,
            )
          : RegisterPage(
              key: ValueKey<bool>(showLoginPage),
              onTap: togglePages,
            ),
    );
  }
}
