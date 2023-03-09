import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

import '../category/category.dart';
import '../constants/buttons/bottom_nav_bar_icon.dart';
import '../constants/constants.dart';
import '../controller/fav_controller.dart';
import '../favorites/favorite_view.dart';
import '../home_page/home_page.dart';
import '../profilepage/profile_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  FavoriteController controllerfav = Get.put(FavoriteController());
  int selectedIndex = 0;
  List pages = [
    const Home(),
    Category(),
    const Favorites(),
    const ProfilePage(),
  ];
  @override
  void initState() {
    super.initState();
    controllerfav.returnfav();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.only(bottom: 10),
          height: height62,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconBottonBar(
                text: 'home'.tr,
                icon: IconlyLight.home,
                selected: selectedIndex == 0,
                onPressed: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
              ),
              IconBottonBar(
                text: 'category'.tr,
                icon: IconlyLight.category,
                selected: selectedIndex == 1,
                onPressed: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
              ),
              IconBottonBar(
                text: 'favorites'.tr,
                icon: IconlyLight.star,
                selected: selectedIndex == 2,
                onPressed: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                },
              ),
              IconBottonBar(
                text: 'user'.tr,
                icon: IconlyLight.profile,
                selected: selectedIndex == 3,
                onPressed: () {
                  setState(() {
                    selectedIndex = 3;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
