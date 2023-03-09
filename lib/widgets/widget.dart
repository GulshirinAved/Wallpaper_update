import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../constants/constants.dart';
import '../controller/category_service.dart';
import '../controller/controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  bool leading;
  bool elevation;
  String name;

  CustomAppBar({required this.leading, required this.name, required this.elevation, Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
      centerTitle: true,
      elevation: elevation ? 1 : 0,
      leading: leading
          ? IconButton(
              onPressed: () {
                Get.back();
                CategoryImageServices().categoryImages.clear();
              },
              icon: Icon(
                IconlyLight.arrowLeftCircle,
                color: Theme.of(context).colorScheme.secondary,
                size: 30,
              ),
            )
          : Container(),
      title: Text(
        name,
        style: TextStyle(
          fontSize: fonstzie30,
          fontFamily: fontstyleGilroyBold,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }

  @override
  Widget get child => const Text('ad');

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}

Container circular45(
  String image,
) {
  return Container(
    height: height30,
    width: width30,
    decoration: BoxDecoration(borderRadius: borderRadius15, image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill), color: kblackcolor),
  );
}

void changeLanguageimage() {
  final HomeController homecontroller = HomeController();
  Get.bottomSheet(
    Material(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(top: height20, bottom: 5),
            child: Text(
              'SelectLanguage'.tr,
              style: const TextStyle(color: kblackcolor, fontSize: fontsize22, fontFamily: fontstyleGilroyBold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Divider(
              thickness: 2,
              endIndent: width50,
              indent: width50,
            ),
          ),
          button(flags.first, 'English'.tr, () {
            homecontroller.selectLanguage(1);

            Get.back();
          }),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Divider(
              thickness: 2,
              endIndent: width50,
              indent: width50,
            ),
          ),
          button(flags[1], 'Russian'.tr, () {
            homecontroller.selectLanguage(2);
            Get.back();
          }),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Divider(
              thickness: 2,
              endIndent: width50,
              indent: width50,
            ),
          ),
          button(flags[2], 'Turkmen'.tr, () {
            homecontroller.selectLanguage(3);
            Get.back();
          }),
          const SizedBox(
            height: 7,
          )
        ],
      ),
    ),
  );
}

GestureDetector button(
  String imageName,
  String language,
  Function() ontap,
) {
  return GestureDetector(
    onTap: ontap,
    child: Padding(
      padding: EdgeInsets.only(left: width50),
      child: Row(
        children: [
          Container(
            height: height30,
            width: width30,
            decoration: BoxDecoration(borderRadius: borderRadius20, image: DecorationImage(image: AssetImage(imageName), fit: BoxFit.cover)),
          ),
          SizedBox(
            width: width25,
          ),
          Text(
            language,
            style: const TextStyle(color: kblackcolor, fontSize: fontsize20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: height5,
          )
        ],
      ),
    ),
  );
}

ListTile aboutPageWidget(String name, IconData icon, BuildContext context) {
  return ListTile(
    onTap: () {
      launchUrlString('mailto:dadebaygurbanow333@gmail.com?subject= &body=');
    },
    leading: Icon(
      icon,
      color: Theme.of(context).colorScheme.secondary,
    ),
    title: Text(
      name,
      style: TextStyle(
        fontFamily: fontstyleGilroyBold,
        color: Theme.of(context).colorScheme.secondary,
      ),
    ),
  );
}

dynamic loading() {
  return Center(child: Lottie.asset('assets/animations/1.json', height: height100, reverse: true, repeat: true, fit: BoxFit.cover));
}

Center nolike() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('assets/animations/4.json', height: 200, reverse: true, repeat: true, fit: BoxFit.cover),
        Text(
          'nolikefound'.tr,
          style: const TextStyle(color: kblackcolor, fontFamily: fontstyleGilroyBold, fontSize: fontsize16),
        )
      ],
    ),
  );
}

LottieBuilder nowifi() {
  return Lottie.asset('assets/animations/5.json', height: 150, reverse: true, repeat: true, fit: BoxFit.cover);
}

CustomFooter footer() {
  return CustomFooter(
    builder: (BuildContext context, LoadStatus? mode) {
      Widget body;
      if (mode == LoadStatus.idle) {
        body = const Text('Garasyn...');
      } else if (mode == LoadStatus.loading) {
        body = const CircularProgressIndicator(
          color: kblueColor,
        );
      } else if (mode == LoadStatus.failed) {
        body = const Text('Load Failed!Click retry!');
      } else if (mode == LoadStatus.canLoading) {
        body = const Text('');
      } else {
        body = const Text('No more Data');
      }
      return SizedBox(
        height: 55.0,
        child: Center(child: body),
      );
    },
  );
}
