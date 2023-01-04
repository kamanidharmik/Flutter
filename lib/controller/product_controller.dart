import 'dart:convert';

import 'package:ecommerce/modals/product_modal.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProducatController extends GetxController {
  List<Products> products = [];

  

  getproducts() async {
    http.Response response = await http
        .post(Uri.parse("http://192.168.43.2/e-commerce/productapi.php"));

    if (response.statusCode == 200) {
      print(response.body);
      var responseData = json.decode(response.body.toString());
      for (var product in responseData) {
        Products prods = Products(
            id: product["pro_id"],
            name: product["pro_name"],
            desc: product["pro_desc"],
            image: product["pro_image"],
            fav: product["pro_favurite"]);
        //Adding user to the list.
        products.add(prods);
      }
    } else {
      print("Data Not Found");
    }
    update();
  }
}
