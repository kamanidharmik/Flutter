import 'package:ecommerce/Pages/login_page.dart';
import 'package:ecommerce/Pages/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(GetMaterialApp(
    home: prefs.getString("username") == null ||
            prefs.getString("password") == null
        ? LoginPage()
        : const ProductScreen(),
  ));
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   SharedPreferences? sharedPreferences;

//   getsharedpreferencesdata() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//   }

//   @override
//   void initState() {
//     getsharedpreferencesdata();
//     // TODO: implement initState
//     super.initState();
//   }

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: 
//     );
//   }
// }
