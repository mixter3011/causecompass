import 'dart:ui';

import 'package:causecompass/auth/auth_service.dart';
import 'package:causecompass/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class ChoicePage extends StatelessWidget {
  ChoicePage({super.key});

  void logout() {
    // get auth service
    final _auth = AuthService();
    _auth.signOut();
  }

  void navigateToDashboardPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Dashboard()),
    );
  }

  void navigateToHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: logout,
            icon: const Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'lib/assets/LoginPage.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0),
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 0),
                  Image.asset(
                    'lib/assets/Logo.png',
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 30),

                  // Join as a NGO Button
                  ElevatedButton(
                    onPressed: () => navigateToDashboardPage(context),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.grey[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text("Join as a NGO"),
                  ),
                  const SizedBox(height: 40),

                  // Join as a Contributor Button
                  ElevatedButton(
                    onPressed: () => navigateToHomePage(context),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.grey[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("Join as a Contributor"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
