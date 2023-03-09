// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// class HomeController extends GetxController {
//   final RxInt findmainColor = 1.obs;
//   final List _popularProductList = [];
//   final RxBool _favorite = true.obs;
//   List get popularProductList => _popularProductList;
//   bool get favorite => _favorite.value;
//   RxList listforfavimage = [].obs;

//   final storage = GetStorage();
//   saveColorInt(int a) {
//     findmainColor.value = a;
//     storage.write("mainColor", findmainColor.value);
//   }

//   returnMaincolor() async {
//     int a = storage.read("mainColor");
//     findmainColor.value = a;
//     return findmainColor.value;
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  GetStorage storage = GetStorage();
  dynamic selectLanguage(int laangauge) {
    if (laangauge == 1) {
      Get.updateLocale(const Locale('en'));
      storage.write('lancode', 'en');
    } else if (laangauge == 2) {
      Get.updateLocale(const Locale('ru'));
      storage.write('lancode', 'ru');
    } else {
      Get.updateLocale(const Locale('tm'));
      storage.write('lancode', 'tm');
    }
    update();
  }
}
