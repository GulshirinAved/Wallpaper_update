import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FavoriteController extends GetxController {
  RxList products = [].obs;
  RxList favList2ToShow = [].obs;

  GetStorage storage = GetStorage();

  dynamic addfav(String url) async {
    products.add(url);

    products.refresh();

    final jsonString = jsonEncode(products);
    await storage.write('products', jsonString);
  }

  dynamic removefavitem(String url) async {
    if (products.isEmpty) {
      Get.snackbar('hellow', 'isempty');
    } else {
      products.removeWhere((element) => element == url);
    }
    products.refresh();
    final jsonString = jsonEncode(products);
    await storage.write('products', jsonString);
  }

  dynamic returnfav() async {
    final result = await storage.read('products') ?? [];

    final List<dynamic> jsonData = jsonDecode(result.toString());
    // List jsonData = List.from(json.decode(result));
    for (int i = 0; i < jsonData.length; i++) {
      addfav(
        jsonData[i],
      );
    }
  }

  // dynamic addfav(String url) async {
  //   if (products.isEmpty) {
  //     products.add(url);
  //   } else {
  //     bool value = false;
  //     for (final element in products) {
  //       if (element == url) {
  //         value = true;
  //       }
  //     }
  //     if (value) {
  //       products.removeWhere((element) => element == url);
  //     } else if (!value) {
  //       products.add(url);
  //     }
  //   }
  //   products.refresh();

  //   final String jsonString = jsonEncode(products);
  //   await storage.write('products', jsonString);
  // }

  // dynamic returnfavList() async {
  //   final a = storage.read('products');
  //   if (storage.read('products') != null) {
  //     final result = storage.read('products') ?? [];
  //     final List jsonData = jsonDecode(result);
  //     if (jsonData.isEmpty) {
  //     } else {
  //       for (int i = 0; i < jsonData.length; i++) {
  //         addfav(jsonData[i]);
  //       }
  //     }
  //   }
  // }
}
