import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../category/show_all_images.dart';
import '../constants.dart';

class FirstCategoryCard extends StatelessWidget {
  final String name;
  const FirstCategoryCard({required this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 9, bottom: 8, top: 2),
      child: TextButton(
        onPressed: () {
          Get.to(() => ShowAllImages(pageName: name, query: name));
        },
        child: Text(
          name.tr,
          style: TextStyle(fontFamily: fontstyleGilroyBold, color: Theme.of(context).colorScheme.secondary, fontSize: fontsize16),
        ),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
          backgroundColor: MaterialStateProperty.all(
            Theme.of(context).scaffoldBackgroundColor,
          ),
          elevation: MaterialStateProperty.all(3.2),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: borderRadius20)),
          shadowColor: MaterialStateProperty.all(Theme.of(context).colorScheme.onSecondary),
        ),
      ),
    );
  }
}
