import 'package:dpr_app/services/auth_service.dart';
import 'package:dpr_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final String emailValid =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  void formValidation() {
    final email = emailController.text.trim();
    final password = passwordController.text;
    if (_formKey.currentState!.validate()) {
      if (AuthService.login(email, password)) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/projectList',
          (Route<dynamic> route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid email or password')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TITLE
                Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                ),

                SizedBox(height: 50),

                // EMAIL
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address.';
                    } else if (!RegExp(emailValid).hasMatch(value)) {
                      return 'Please enter a valid email address.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Icon(Icons.person_rounded, color: Colors.black),
                    ),
                    hintText: "Email",
                  ),
                ),
                SizedBox(height: 25),

                // PASSWORD
                TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password.';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Icon(Icons.lock_rounded, color: Colors.black),
                    ),
                    hintText: "Password",
                  ),
                ),

                SizedBox(height: 50),

                // LOGIN BUTTON
                CustomButton(text: 'Login', onPressed: formValidation, textSize: 20),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
