import 'package:flutter/material.dart';
import 'package:petpal/Password%20Forget/forgot_password.dart';

import 'package:petpal/user%20registration/SignUp.dart';
import 'package:petpal/user%20registration/homeScreen.dart';
import 'package:petpal/user%20registration/services/authentication.dart';
import 'package:petpal/user%20registration/widget/showSnackbar.dart';
import 'package:petpal/user%20registration/widget/text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginUsers() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      showSnackBar(context, "Please fill in both fields");
      return;
    }

    setState(() {
      isLoading = true;
    });

    String res = await AuthServices().loginUser(
      email: emailController.text,
      password: passwordController.text,
    );

    setState(() {
      isLoading = false;
    });

    if (res == "user") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                height: height / 2.7,
                child: Image.asset("images/logo.png"),
              ),
              TextFieldInput(
                hintText: "Email",
                icon: Icons.email,
                textEditingController: emailController,
              ),
              TextFieldInput(
                hintText: "Password",
                icon: Icons.lock,
                textEditingController: passwordController,
                isPass: true,
              ),
              SizedBox(height: 10),
              const Forgot_password(),
              SizedBox(height: height / 35),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  minimumSize: Size(230.51, 68.1),
                ),
                onPressed: loginUsers,
                child: Text("Login",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              SizedBox(height: height / 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUp()),
                      );
                    },
                    child: const Text(
                      " Sign Up",
                      style: TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 20),
           
             
              // Adjust height
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20),
                color: Colors.orange,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "All rights reserved",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          letterSpacing: 1.2),
                    ),
                  ),
                ), // Coral orange color
              ),
            ],
          ),
        ),
      ),
    );
  }
}
