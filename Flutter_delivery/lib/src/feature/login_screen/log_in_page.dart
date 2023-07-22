import 'package:flutter/material.dart';
import 'package:flutter_application_delivery/src/feature/home_screen/home_screen.dart';

import '../../widget/animator.dart';
import '../../widget/button_widget.dart';
import '../../widget/custom_text.dart';
import '../../widget/form_feild.dart';
import '../../widget/validate_form.dart';
import 'forgot_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _emailController.clear();
    _passwordController.clear();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _keyForm,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [],
                ),
              ),
              const SizedBox(height: 20.0),
              Image.asset(
                'lib/src/res/Screenshot 2023-07-13 at 3.40.29 PM.png',
                height: 180,
              ),
              const SizedBox(height: 30.0),
              const SizedBox(height: 5.0),
              const Text('Log in\nyour account',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
              const SizedBox(height: 20.0),
              FormFieldFrave(
                controller: _emailController,
                hintText: 'User Name',
                keyboardType: TextInputType.emailAddress,
                validator: validatedEmail,
              ),
              const SizedBox(height: 20.0),
              const SizedBox(height: 5.0),
              FormFieldFrave(
                controller: _passwordController,
                hintText: 'Password',
                isPassword: true,
                validator: passwordValidator,
              ),
              const SizedBox(height: 10.0),
              Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                      onTap: () => Navigator.push(
                          context, route(page: const ForgotPasswordScreen())),
                      child: const TextCustom(
                          text: 'Forgot Password?',
                          fontSize: 17,
                          color: Colors.blue))),
              const SizedBox(height: 40.0),
              BtnFrave(
                text: 'Login',
                fontSize: 21,
                height: 50,
                fontWeight: FontWeight.w500,
                onPressed: () =>
                    Navigator.push(context, route(page: const HomeScreen())),
              )
            ],
          ),
        ),
      ),
    );
  }
}
