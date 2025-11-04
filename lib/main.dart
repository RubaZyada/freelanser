import 'package:ecommerce/ecommerce/presentation/screens/freelanser_details.dart';
import 'package:ecommerce/ecommerce/presentation/screens/home.dart';
import 'package:ecommerce/ecommerce/presentation/screens/login.dart';
import 'package:ecommerce/ecommerce/presentation/screens/signup.dart';
import 'package:ecommerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // استدعي هدا السطر عشان ال async in main
  WidgetsFlutterBinding.ensureInitialized();

 final prefs = await SharedPreferences.getInstance();
 String? userEmail = prefs.getString(Login.userCredentialKey);
  //runApp(const MyApp());
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.login: (context) => Login(),
        Routes.home: (context) => Home(),
        Routes.signup: (context) => Signup(),
       
        Routes.freelancerDetails: (context) => FreelancerDetails(),
       
      },
     // shared preferences
      home: userEmail != null ? Home(name: userEmail,) : Login(),
      
    
     
    ),
  );
}
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       routes: {
//         Routes.login: (context) => Login(),
//         Routes.home: (context) => Home(),
//         Routes.signup: (context) => Signup(),
//         Routes.main: (context) => MainApp(),
//         Routes.freelancerDetails: (context) => FreelancerDetails(),
//         Routes.mainNavScreen: (context) => MainNavScreen(),
//       },
//     home: userEmail!= null ? Home(name: userEmail,) : Login(),  
//     );
//   }
// }
