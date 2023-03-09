import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../controller/fav_controller.dart';
import '../constants.dart';

class FavButton extends StatefulWidget {
  final int index;
  final String url;
  double? height;
  double? width;
  FavButton({
    required this.index,
    required this.url,
    this.height,
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  FavoriteController controllerfav = Get.find<FavoriteController>();
  GetStorage storage = GetStorage();
  bool value = false;
  @override
  void initState() {
    super.initState();
    work();
  }

  dynamic work() {
    for (var element in controllerfav.products) {
      if (element == widget.url) {
        value = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    work();
    return GestureDetector(
      onTap: () {
        value = !value;
        if (value) {
          controllerfav.addfav(widget.url);
          like('added'.tr);
        } else {
          controllerfav.removefavitem(widget.url);
          like('remove'.tr);
        }

        setState(() {});
      },
      child: Container(
        height: height42,
        width: width42,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Icon(
          value ? IconlyBold.heart : IconlyLight.heart,
          color: kredColor,
        ),
      ),
    );
  }
}

dynamic like(String title) {
  Get.rawSnackbar(
    margin: const EdgeInsets.all(8),
    borderRadius: 15,
    backgroundColor: Colors.white70,
    messageText: Center(
      child: Text(
        title,
        style: const TextStyle(color: kblackcolor, fontSize: fontsize20, fontFamily: 'gilroy-bold'),
      ),
    ),
    snackPosition: SnackPosition.TOP,
  );
}
