import 'package:flutter/material.dart';
import 'package:user_app/authentication/login_screen.dart';
import 'package:user_app/methods/common_methods.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  CommonMethods cMethod = CommonMethods();

  checkIfNetworkAvailable() {
    cMethod.checkConnectivity(context);

    signUpFormValidation();
  }

  signUpFormValidation() {
    if (userNameTextEditingController.text.trim().length < 3) {
      cMethod.displaySnackBar(
          "Your name must be at least 4 or more characters", context);
    } else if (phoneTextEditingController.text.trim().length < 8) {
      cMethod.displaySnackBar("Phone number must be 8 digits", context);
    } else if (!emailTextEditingController.text.contains("@")) {
      cMethod.displaySnackBar("Please enter a valid email address", context);
    } else if (passwordTextEditingController.text.trim().length < 5) {
      cMethod.displaySnackBar(
          "Password must be at least 5 characters", context);
    } else {
      // Register user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset('assets/images/logo.png'),
              const Text(
                "Create a User's Account",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              // Text Field + button
              Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [
                    TextField(
                      controller: userNameTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "User Name",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 22),
                    TextField(
                      controller: phoneTextEditingController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: "User Phone",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 22),
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: "User Email",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 22),
                    TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "User Password",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                        onPressed: () {
                          checkIfNetworkAvailable();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          padding: const EdgeInsets.symmetric(horizontal: 80),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: const Text("Sign Up")),
                  ],
                ),
              ),

              // TextButton
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.grey,
                ),
                child: const Text("Already have an account? Login Here"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
