import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../category/show_all_images.dart';
import '../constants.dart';

class ThirdCategoryCard extends StatelessWidget {
  final int index;
  const ThirdCategoryCard({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ShowAllImages(pageName: secondCategoryName[index], query: secondCategoryName[index]));
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: categoryColors[index], borderRadius: borderRadius20, boxShadow: [BoxShadow(color: categoryColors[index], blurRadius: blurRadius3)]),
            margin: EdgeInsets.only(left: width8, right: width8, top: height70, bottom: height5),
            width: width180,
          ),
          Positioned(
            bottom: height100,
            child: Image.asset(
              categoryImages[index],
              width: width198,
              height: height185,
            ),
          ),
          Positioned(
            top: height143,
            height: height43,
            child: Opacity(
              opacity: .2,
              child: Image.asset(
                'assets/categoryimages/0.png',
                width: height200,
                height: width110,
              ),
            ),
          ),
          Positioned(
            top: height210,
            left: width30,
            child: Text(
              secondCategoryName[index].toString().tr,
              style: const TextStyle(color: kwhiteColor, fontSize: fontsize28, fontFamily: fontstyleGilroyBold),
            ),
          ),
          Positioned(
            top: height247,
            left: width35,
            child: Text(
              imageNumber[index],
              style: const TextStyle(color: kwhiteColor, fontSize: fontsize20, fontWeight: FontWeight.bold, fontFamily: fontstyleGilroyBold),
            ),
          ),
        ],
      ),
    );
  }
}
