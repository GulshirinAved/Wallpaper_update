import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bottomnavbar/bottom_nav_bar.dart';
import '../constants/constants.dart';
import '../controller/fav_controller.dart';
import '../widgets/widget.dart';


class ConnectionCheckpage extends StatefulWidget {
  const ConnectionCheckpage({Key? key}) : super(key: key);

  @override
  _ConnectionCheckpageState createState() => _ConnectionCheckpageState();
}

class _ConnectionCheckpageState extends State with TickerProviderStateMixin {
  late Animation animation1;

  double _containerOpacity = 0.0;
  late AnimationController _controller;
  FavoriteController controllerfav = FavoriteController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));

    checkConnection();
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _containerOpacity = 1;
      });
    });
  }

  void checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
        await Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const BottomNavBar();
              },
            ),
          );
        });
      }
    } on SocketException catch (_) {
      _showDialog();
    }
  }

  void _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: borderRadius15),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              padding: EdgeInsets.only(top: height43, left: width12, right: width12, bottom: 50),
              decoration: BoxDecoration(color: Colors.white, borderRadius: borderRadius20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  nowifi(),
                  Text(
                    'noConnection1'.tr,
                    style: const TextStyle(
                      fontSize: fontsize27,
                      color: kblackcolor,
                      fontFamily: fontstyleGilroyMedium,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height2, horizontal: width5),
                    child: Text(
                      'noConnection2'.tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: kblackcolor,
                        fontSize: fontsize16,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Future.delayed(const Duration(milliseconds: 1000), () {
                        checkConnection();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kwhiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: borderRadius10,
                      ),
                      padding: EdgeInsets.symmetric(vertical: height10, horizontal: width12),
                    ),
                    child: Text(
                      'noConnection3'.tr,
                      style: const TextStyle(fontSize: fontsize18, color: kblackcolor, fontFamily: fontstyleGilroyMedium),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                curve: Curves.fastLinearToSlowEaseIn,
                opacity: _containerOpacity,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: kwhiteColor,
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Image.asset(
                      'assets/splashscreenimage/wallpaperlogo.png',
                      height: height250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const LinearProgressIndicator()
        ],
      ),
    );
  }
}
