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
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: controller.cartlist.isEmpty
                ? const Center(
                    child: Text("Your Cart Is Empty"),
                  )
                : Expanded(
                    child: GetBuilder(
                        init: controller,
                        builder: ((cartcontroller) {
                          return ListView.builder(
                            itemBuilder: ((context, index) {
                              return Card(
                                elevation: 3,
                                child: ListTile(
                                    title: Text(
                                        cartcontroller.cartlist[index].name),
                                    subtitle: Text(
                                        cartcontroller.cartlist[index].desc),
                                    leading: Image.network(
                                        "http://192.168.43.171/e-commerce/${controller.products[index].image}")),
                              );
                            }),
                            itemCount: cartcontroller.cartlist.length,
                          );
                        })),
                  ),
          )
        ],
      ),
    );
  }
}
