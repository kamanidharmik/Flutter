import 'package:ecommerce/modals/product_modal.dart';
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
  TextEditingController searchcontroller = TextEditingController();

  searchdatafromlist(String value) {
    productcontroller.searcheddatalist.clear();
    productcontroller.products.forEach((element) {
      if (element.name.contains(value)) {
        print(element.name);
        productcontroller.searcheddatalist.add(element);
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productcontroller.searcheddatalist.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchcontroller,
              onSubmitted: (value) {
                print(
                    "Lenght Of Data ${productcontroller.searcheddatalist.length}");
              },
              onChanged: ((value) {
                searchdatafromlist(value);
              }),
              decoration: InputDecoration(
                filled: true,
                hintText: "Search Products",
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: GetBuilder(
                init: productcontroller,
                builder: ((controller) {
                  return Column(
                    children: [
                      controller.searcheddatalist.isEmpty &&
                              searchcontroller.text.isEmpty
                          ? Expanded(
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
                                            "http://192.168.43.171/e-commerce/${controller.products[index].image}",
                                            height: 100,
                                            width: 100,
                                          ),
                                          Text(controller.products[index].name),
                                          Text(controller.products[index].desc),
                                          ElevatedButton(
                                              onPressed: () {
                                                Products cartproductobject =
                                                    Products(
                                                        id: controller
                                                            .products[index].id,
                                                        name: controller
                                                            .products[index]
                                                            .name,
                                                        desc: controller
                                                            .products[index]
                                                            .desc,
                                                        fav: controller
                                                            .products[index]
                                                            .fav,
                                                        image: controller
                                                            .products[index]
                                                            .image);
                                                controller.cartlist
                                                    .add(cartproductobject);
                                                controller.listtotal.add(
                                                    controller
                                                        .products[index].id
                                                        .toString());
                                              },
                                              child: const Text("Add To Cart")),
                                        ],
                                      ),
                                    );
                                  }),
                            )
                          : Expanded(
                              child: GridView.builder(
                                  itemCount: controller.searcheddatalist.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                  ),
                                  itemBuilder: (context, index) {
                                    print(
                                        "From Else Lenght ${controller.searcheddatalist.length}");
                                    var favdata = controller
                                        .searcheddatalist[index].fav
                                        .toString();
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: Column(
                                        children: [
                                          Image.network(
                                            "http://192.168.43.171/e-commerce/${controller.searcheddatalist[index].image}",
                                            height: 100,
                                            width: 100,
                                          ),
                                          Text(controller
                                              .searcheddatalist[index].name),
                                          Text(controller
                                              .searcheddatalist[index].desc),
                                          ElevatedButton(
                                              onPressed: () {
                                                Products cartproductobject =
                                                    Products(
                                                        id: controller
                                                            .searcheddatalist[
                                                                index]
                                                            .id,
                                                        name: controller
                                                            .searcheddatalist[
                                                                index]
                                                            .name,
                                                        desc: controller
                                                            .searcheddatalist[
                                                                index]
                                                            .desc,
                                                        fav: controller
                                                            .searcheddatalist[
                                                                index]
                                                            .fav,
                                                        image: controller
                                                            .searcheddatalist[
                                                                index]
                                                            .image);
                                                controller.cartlist
                                                    .add(cartproductobject);
                                                controller.listtotal.add(
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
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
