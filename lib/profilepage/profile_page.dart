import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../constants/buttons/profile_buttons.dart';
import '../controller/controller.dart';
import '../theme/theme_service.dart';
import '../widgets/widget.dart';
import 'about_app.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  IconData moonIcon = CupertinoIcons.moon_stars;
  HomeController homeController = HomeController();
  final bool dark = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(leading: false, name: 'me'.tr, elevation: false),
        body: Column(
          children: [
            GestureDetector(
              onTap: () async {
                await Share.share('https://play.google.com/store/apps/details?id=com.wallpaper.tazewallpaper&hl=ru&gl=US');
              },
              child: ProfileBottons(
                iconfortrailing: IconlyLight.send,
                title: 'tellafriend'.tr,
                trailing: 3,
              ),
            ),
            GestureDetector(
              onTap: () {
                launchUrlString('https://play.google.com/store/apps/details?id=com.wallpaper.tazewallpaper&hl=ru&gl=US');
              },
              child: ProfileBottons(
                iconfortrailing: IconlyLight.message,
                title: 'feedback'.tr,
                trailing: 3,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const AboutUs());
              },
              child: ProfileBottons(
                iconfortrailing: IconlyLight.infoSquare,
                title: 'aboutapp'.tr,
                trailing: 3,
              ),
            ),
            GestureDetector(
              onTap: () {
                ThemeService().changeThemeMode();
              },
              child: ProfileBottons(
                iconfortrailing: IconlyLight.paperPlus,
                title: 'NightMode'.tr,
                trailing: 1,
                darkmode: false,
              ),
            ),
            GestureDetector(
              onTap: () {
                changeLanguageimage();
                setState(() {});
              },
              child: ProfileBottons(
                iconfortrailing: Icons.language_outlined,
                title: 'Language'.tr,
                trailing: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
