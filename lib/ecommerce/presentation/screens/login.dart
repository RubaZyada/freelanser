// ignore_for_file: use_build_context_synchronously

import 'package:ecommerce/ecommerce/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce/ecommerce/presentation/cubit/auth_state.dart';
import 'package:ecommerce/ecommerce/presentation/screens/home.dart';
import 'package:ecommerce/ecommerce/presentation/widgets/custom_text_field.dart';
import 'package:ecommerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  // ignore: override_on_non_overriding_member
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
@override 
void initState(){
  super.initState();
  context.read<AuthCubit>().checkIfLogin();
 
}
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
         
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => Home(name: state.user.email?? ''),
          ));
          // }
          //  );
        } else if (state is AuthErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.errorMessage),
              duration: Duration(seconds: 1),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          backgroundColor: Color(0xFFB2BACD),
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/login1.jpg", height: 200),
                  SizedBox(height: 10),
                  CustomTextField(
                    hintText: "Email",
                    prefixIcon: Icons.email,
                    cont: emailController,
                    validat: (email) {
                      if (email!.contains("@") && email.contains(".")) {
                        return null;
                      }
                      return 'Please enter a valid email';
                    },
                  ),
                  CustomTextField(
                    hintText: "Password",
                    prefixIcon: Icons.lock,
                    suffixIcon: Icons.remove_red_eye,
                    isPassword: true,
                    cont: passwordController,
                    validat: (password) {
                      if (password!.length >= 8) return null;
                      return 'Please enter at least 8 characters';
                    },
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.signup);
                    },
                    child: Text(
                      "You dont have account ?",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 10),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFB2BACD),
                          padding: EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 15,
                          ),
                          textStyle: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          _login(context);
                        },
                        child: state is AuthLoadingState
                            ? CircularProgressIndicator()
                            : Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _login(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));

    if (_formKey.currentState!.validate()) {
      String email = emailController.text;
      String password = passwordController.text;

      // Call login method from AuthCubit
      context.read<AuthCubit>().login(email, password);
    } else {
      // ignore: use_build_context
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Please fix the errors in red before submitting.'),
        ),
      );
    }
  }
}
