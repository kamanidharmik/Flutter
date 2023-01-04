import 'package:ecommerce/Pages/register_page.dart';
import 'package:ecommerce/controller/user_controller.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/modals/usermodal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final usercontroller = Get.put(Users());

  checkvalidation() async {
    if (_formKey.currentState!.validate()) {
      usercontroller.getusers(usernamecontroller.text, passwordcontroller.text);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("username", usernamecontroller.text);
      sharedPreferences.setString("password", passwordcontroller.text);
    } else {
      usernamecontroller.text = "";
      passwordcontroller.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Center(
                        child: Text(
                      "Login",
                      style: TextStyle(fontSize: 50),
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: usernamecontroller,
                      decoration: const InputDecoration(
                          hintText: 'Enter Username',
                          labelText: 'Enter Password',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Username Must Not be Empty';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        controller: passwordcontroller,
                        decoration: const InputDecoration(
                            hintText: 'Enter Password',
                            labelText: 'Enter Password',
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password Must Not be Empty';
                          } else {
                            return null;
                          }
                        }),
                    ElevatedButton(
                        onPressed: () {
                          checkvalidation();
                        },
                        child: const Text("Login")),
                    TextButton(
                        onPressed: () {
                          Get.off(Register_Page());
                        },
                        child: const Text("Don't Have An Account...?")),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
