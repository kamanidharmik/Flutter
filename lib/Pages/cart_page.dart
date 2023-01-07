import 'package:ecommerce/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart_Screen extends StatefulWidget {
  const Cart_Screen({super.key});

  @override
  State<Cart_Screen> createState() => _Cart_ScreenState();
}

class _Cart_ScreenState extends State<Cart_Screen> {
  final controller = Get.put(ProducatController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        controller.listtotal.isEmpty
            ? const Center(
                child: Text("Your Cart Is Empty"),
              )
            : GetBuilder(
                init: controller,
                builder: ((cartcontroller) {
                  return ListView.builder(
                    itemBuilder: ((context, index) {
                      return Card(
                        child: Text(cartcontroller.listtotal[index].toString()),
                      );
                    }),
                    itemCount: cartcontroller.listtotal.length,
                  );
                }))
      ],
    );
  }
}
