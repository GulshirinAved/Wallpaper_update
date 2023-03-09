import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/widget.dart';
import '../cards/dark_mode.dart';
import '../constants.dart';

class ProfileBottons extends StatefulWidget {
  final String title;
  int trailing;
  final IconData iconfortrailing;
  bool? darkmode;

  ProfileBottons({required this.title, required this.trailing, required this.iconfortrailing, this.darkmode, Key? key}) : super(key: key);

  @override
  State<ProfileBottons> createState() => _ProfileBottonsState();
}

class _ProfileBottonsState extends State<ProfileBottons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: width8),
      child: ListTile(
        contentPadding: const EdgeInsets.all(2),
        leading: widget.trailing == 1
            ? DarkMode(darkmode: false)
            : widget.trailing == 2
                ? Get.locale!.toLanguageTag() == 'en'
                    ? circular45(flags.first)
                    : Get.locale!.toLanguageTag() == 'ru'
                        ? circular45(flags[1])
                        : circular45(flags[2])
                : Icon(
                    widget.iconfortrailing,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
        title: Text(widget.title, style: const TextStyle(fontSize: fontsize18, fontFamily: fontstyleGilroyBold)),
      ),
    );
  }
}
