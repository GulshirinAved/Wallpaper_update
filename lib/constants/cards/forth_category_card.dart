import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../category/show_all_images.dart';
import '../constants.dart';

class ForthCategoryCard extends StatelessWidget {
  final int index;

  const ForthCategoryCard({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ShowAllImages(pageName: categoryNamerRcommended[index], query: categoryNamerRcommended[index]));
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: borderRadius6,
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [BoxShadow(color: Theme.of(context).colorScheme.onSecondary, blurRadius: blurRadius3)],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: borderRadius7,
                  child: Image.asset(
                    recomendImages[index],
                    height: width70,
                    fit: BoxFit.cover,
                    width: width74,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 60,
                        child: Text(
                          categoryNamerRcommended[index].toString().tr,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: fontsize16, fontFamily: fontstyleGilroyBold),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        imageNumber[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: fontsize16, fontWeight: FontWeight.bold, fontFamily: fontstyleGilroyBold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
