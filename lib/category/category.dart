import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/cards/first_category_card.dart';
import '../constants/cards/forth_category_card.dart';
import '../constants/cards/second_category_card.dart';
import '../constants/cards/third_category_card.dart';
import '../constants/constants.dart';
import '../widgets/widget.dart';

class Category extends StatelessWidget {
  Category({Key? key}) : super(key: key);

  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        elevation: false,
        leading: false,
        name: 'category'.tr,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            firstCategory(),
            secondCategory(),
            thirdCategory(context),
            recommended(context),
            lastCategory(),
          ],
        ),
      ),
    );
  }

  GridView lastCategory() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: categoryColors.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 8,
            right: 8,
          ),
          child: ForthCategoryCard(
            index: index,
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 12, childAspectRatio: 2.2),
    );
  }

  Container recommended(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: const EdgeInsets.only(left: 9, bottom: 10, top: 10),
      child: Text('Recommended'.tr, style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: fontsize22, fontFamily: fontstyleGilroyBold)),
    );
  }

  Container thirdCategory(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      height: height280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categoryImages.length,
        itemBuilder: (BuildContext context, int index) {
          return ThirdCategoryCard(index: index);
        },
      ),
    );
  }

  SizedBox secondCategory() {
    return SizedBox(
      height: height64,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categoryColors.length,
        itemBuilder: (BuildContext context, int index) {
          return SecondCategoryCard(index: index);
        },
      ),
    );
  }

  SizedBox firstCategory() {
    return SizedBox(
      height: height60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categoryName.length,
        itemBuilder: (BuildContext context, int index) {
          return FirstCategoryCard(name: categoryName[index]);
        },
      ),
    );
  }
}
