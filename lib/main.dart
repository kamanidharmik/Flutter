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
