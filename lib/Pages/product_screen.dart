import 'package:ecommerce/Pages/cart_page.dart';
import 'package:ecommerce/Pages/login_page.dart';
import 'package:ecommerce/Pages/pro_data.dart';
import 'package:ecommerce/Pages/profile_page.dart';
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

  var cartindex = 0;
  List pages = [
    const ProductsData(),
    const Profile_screen(),
    const Cart_Screen()
  ];
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
              Obx(() => Text(productcontroller.listtotal.length.toString())),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: cartindex,
        onTap: (value) {
          setState(() {
            cartindex = value;
            print(cartindex);
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          )
        ],
      ),
      body: pages[cartindex],
    );
  }
}
