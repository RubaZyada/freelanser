import 'package:ecommerce/ecommerce/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce/ecommerce/presentation/screens/freelanser_details.dart';
import 'package:ecommerce/ecommerce/presentation/screens/home.dart';
import 'package:ecommerce/ecommerce/presentation/screens/login.dart';
import 'package:ecommerce/ecommerce/presentation/screens/signup.dart';
import 'package:ecommerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  // استدعي هدا السطر عشان ال async in main
  WidgetsFlutterBinding.ensureInitialized();


  //runApp(const MyApp());
  runApp(
    BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          Routes.login: (context) => Login(),
          Routes.home: (context) => Home(),
          Routes.signup: (context) => Signup(),

          Routes.freelancerDetails: (context) => FreelancerDetails(),
        },
        // shared preferences
        home: Login(),
      ),
    ),
  );
}

