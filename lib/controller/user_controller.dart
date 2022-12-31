import 'dart:convert';
import 'package:ecommerce/Pages/product_screen.dart';
import 'package:ecommerce/Pages/register_page.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/modals/usermodal.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Users extends GetxController {
  List<UserModal> users = [];

  var username;
  var password;

  getusers(String username, String password) async {
    try {
      http.Response response = await http.post(
          Uri.parse("http://192.168.43.1/e-commerce/loginapi.php"),
          body: {'username': username, 'password': password});

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body.toString());

        for (var product in responseData) {
          UserModal user = UserModal(
              id: product["id"],
              name: product["name"],
              username: product["username"],
              password: product["password"],
              contact: product["contact_num"]);
          //Adding user to the list.
          users.add(user);
          if (username == user.username && password == user.password) {
            print("From Get Users : $username");
            print("From Get Users : $password");
            Get.to(() => const ProductScreen());
          } else {
            Get.snackbar(
              "Error",
              "Username Or Password is invalid",
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        }
      } else {
        print("Data Not Found");
      }
    } catch (e) {
      print(e);
    }
  }
}
