import 'package:ecommerce/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register_Page extends StatelessWidget {
  Register_Page({super.key});

  TextEditingController namecontroller = TextEditingController();
  final controller = Get.put(Users());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
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
                      "Register",
                      style: TextStyle(fontSize: 50),
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: namecontroller,
                      decoration: const InputDecoration(
                          hintText: 'Enter Name', border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Enter Username',
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Enter Password',
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Enter Contact Number',
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: const Text("Register")),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
