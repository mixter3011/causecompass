import 'dart:ui';

import 'package:causecompass/auth/auth_service.dart';
import 'package:causecompass/components/my_button.dart';
import 'package:causecompass/components/my_textfield.dart';
import 'package:causecompass/components/square_tile.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.onTap});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final void Function()? onTap;

  // sign user in method
  void signUserIn(BuildContext context) async {
    // auth service 
    final authService = AuthService();

    // try again 
    try {
      await authService.signInWithEmailPassword(usernameController.text, passwordController.text,);
    }

    // catch any errors 
    catch (e) {
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image with Blur
          Image.asset(
            'lib/assets/LoginPage.png', // Replace with your image asset path
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.2), // Adjust the opacity as needed
            ),
          ),

          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),

                  // Logo Image
                  Image.asset(
                    'lib/assets/Logo.png', // Replace with your logo image asset path
                    width: 150,
                    height: 150,
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'A Small Change to Connect the World',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // username
                  MyTextField(
                    controller: usernameController,
                    hintText: 'Username',
                    obscureText: false,
                  ),

                  const SizedBox(height: 25),

                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 10),

                  // forgot password
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password ?',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // sign in 
                  MyButton(
                    text: "Sign In",
                    onTap: () => signUserIn(context),
                  ),

                  const SizedBox(height: 20),

                  // or continue with
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or Continue with',
                            style: TextStyle(color: Colors.white),),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // google sign in button
                   const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // google button
                      SquareTile(imagePath: 'lib/assets/Google.png'),
                    ],
                  ),

                  const SizedBox(height: 50),

                  // registe now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: onTap,
                        child: const Text("Register Now",
                        style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
