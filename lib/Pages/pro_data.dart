import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/product_controller.dart';

class ProductsData extends StatefulWidget {
  const ProductsData({super.key});

  @override
  State<ProductsData> createState() => _ProductsDataState();
}

class _ProductsDataState extends State<ProductsData> {
  final productcontroller = Get.put(ProducatController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() => productcontroller.isloading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  height: MediaQuery.of(context).size.height,
                  child: GetBuilder(
                      init: productcontroller,
                      builder: ((controller) {
                        return Column(
                          children: [
                            Expanded(
                              child: GridView.builder(
                                  itemCount: controller.products.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                  ),
                                  itemBuilder: (context, index) {
                                    var favdata = controller.products[index].fav
                                        .toString();
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: Column(
                                        children: [
                                          Image.network(
                                            "http://192.168.43.2/e-commerce/${controller.products[index].image}",
                                            height: 100,
                                            width: 100,
                                          ),
                                          Text(controller.products[index].name),
                                          Text(controller.products[index].desc),
                                          ElevatedButton(
                                              onPressed: () {
                                                print(controller
                                                    .products[index].id
                                                    .toString());
                                                controller.addcarttotal(
                                                    controller
                                                        .products[index].id
                                                        .toString());
                                              },
                                              child: const Text("Add To Cart")),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        );
                      })),
                )),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
