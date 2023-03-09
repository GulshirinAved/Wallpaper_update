import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../category/show_all_images.dart';
import '../constants.dart';

class SecondCategoryCard extends StatelessWidget {
  final int index;
  const SecondCategoryCard({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ShowAllImages(pageName: colorss[index], query: colorss[index]));
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: colors[index], blurRadius: blurRadius3),
          ],
          borderRadius: borderRadius8,
          color: colors[index],
        ),
        margin: EdgeInsets.only(left: width9, right: width8, top: height10, bottom: height5),
        height: height50,
        width: width50,
      ),
    );
  }
}
