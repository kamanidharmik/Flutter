import 'package:ecommerce/Pages/login_page.dart';
import 'package:ecommerce/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final productcontroller = Get.put(ProducatController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productcontroller.getproducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
              IconButton(
                  onPressed: () async {
                    SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    sharedPreferences.remove("username");
                    sharedPreferences.remove("password");
                    Get.off(() => LoginPage());
                  },
                  icon: const Icon(Icons.logout))
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                // child: Text("data"),
                ),
            GetBuilder(
                init: productcontroller,
                builder: ((controller) {
                  return Container(
                      height: MediaQuery.of(context).size.height,
                      child: Expanded(
                        child: GridView.builder(
                            itemCount: controller.products.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              var favdata =
                                  controller.products[index].fav.toString();
                              return Card(
                                elevation: 5,
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
                                        onPressed: () {},
                                        child: const Text("Add To Cart"))
                                  ],
                                ),
                              );
                            }),
                      ));
                })),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
