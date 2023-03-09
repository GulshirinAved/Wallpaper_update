import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

import '../constants/buttons/fav_button.dart';
import '../constants/constants.dart';
import '../controller/category_service.dart';
import '../controller/fav_controller.dart';
import '../widgets/widget.dart';

enum SetWallpaperas { Home, Lock, Both }

final _setAs = {
  SetWallpaperas.Home: WallpaperManager.HOME_SCREEN,
  SetWallpaperas.Lock: WallpaperManager.LOCK_SCREEN,
  SetWallpaperas.Both: WallpaperManager.BOTH_SCREEN,
};

class CategoryProfile extends StatefulWidget {
  final String url;
  final int index;

  const CategoryProfile({Key? key, required this.url, required this.index}) : super(key: key);

  @override
  State<CategoryProfile> createState() => _CategoryProfileState();
}

class _CategoryProfileState extends State<CategoryProfile> {
  FavoriteController controller = Get.put(FavoriteController());
  GetStorage storage = GetStorage();
  final isDialOpen = ValueNotifier(false);
  bool fav = false;
  late final InterstitialAd interstitialAd;
  String interstitialAdUnitId = 'ca-app-pub-2076651742538543/1448322158';
  @override
  void initState() {
    super.initState();
    _loadInterstitialAd();
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          interstitialAd = ad;
          _setFullScreenContentCallback(ad);
        },
        onAdFailedToLoad: (LoadAdError loadAdError) {
          print('Interstitial ad failes to load: $loadAdError');
        },
      ),
    );
  }

  void _setFullScreenContentCallback(InterstitialAd ad) {
    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAddShowedFullScreenContent');
      },
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent');
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent $error');
      },
      onAdImpression: (InterstitialAd ad) {
        print('$ad onAdImpression ');
      },
    );
  }

  void _showInterstitialAd() {
    interstitialAd.show();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          if (isDialOpen.value) {
            isDialOpen.value = false;
            Get.back();
            CategoryImageServices().categoryImages.clear();
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: CachedNetworkImage(
                  placeholder: (context, url) {
                    return loading();
                  },
                  imageUrl: widget.url,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                left: 5,
                child: IconButton(
                  color: Theme.of(context).colorScheme.secondary,
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    IconlyLight.arrowLeftCircle,
                    size: iconsize30,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              )
            ],
          ),
          floatingActionButton: SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            animatedIconTheme: IconThemeData(color: Theme.of(context).scaffoldBackgroundColor),
            overlayColor: kblackcolor,
            overlayOpacity: 0.4,
            spacing: 12,
            spaceBetweenChildren: 12,
            closeManually: false,
            openCloseDial: isDialOpen,
            children: [
              SpeedDialChild(
                child: FavButton(
                  index: widget.index,
                  url: widget.url,
                ),
                labelStyle: const TextStyle(color: kblackcolor),
                label: 'favorites'.tr,
              ),
              SpeedDialChild(
                child: const Icon(
                  IconlyLight.send,
                  color: kblackcolor,
                ),
                labelStyle: const TextStyle(color: kblackcolor),
                label: 'Share'.tr,
                onTap: () async {
                  final urlimage = widget.url;
                  final url = Uri.parse(urlimage);
                  final response = await http.get(url);
                  final bytes = response.bodyBytes;

                  final temp = await getTemporaryDirectory();
                  final path = '${temp.path}/image.png';
                  File(path).writeAsBytesSync(bytes);
                  await Share.shareFiles([path]);
                },
              ),
              SpeedDialChild(
                child: const Icon(
                  IconlyLight.download,
                  color: kblackcolor,
                ),
                labelStyle: const TextStyle(color: kblackcolor),
                label: 'Download'.tr,
                onTap: () async {
                  await GallerySaver.saveImage(widget.url, toDcim: true);
                },
              ),
              SpeedDialChild(
                child: const Icon(
                  Icons.screen_lock_portrait,
                ),
                labelStyle: const TextStyle(color: kblackcolor),
                label: 'SetWallpaper'.tr,
                onTap: () async {
                  SetWallpaperas option = await showBottomSheet(context);
                  try {
                    String imageurl = widget.url;
                    final file = await DefaultCacheManager().getSingleFile(imageurl);
                    int location = _setAs[option]!; //can be Home/Lock Screen
                    bool result = await WallpaperManager.setWallpaperFromFile(file.path, location);
                  } on PlatformException {}
                  _showInterstitialAd();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

dynamic notification() {
  Get.rawSnackbar(
    margin: const EdgeInsets.all(8),
    borderRadius: 15,
    backgroundColor: Colors.white,
    messageText: Center(
      child: Text(
        'Oboi'.tr,
        style: const TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'gilroy-bold'),
      ),
    ),
    snackPosition: SnackPosition.BOTTOM,
  );
}

Future showBottomSheet(BuildContext context) => showModalBottomSheet(
      enableDrag: false,
      isDismissible: false,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(
                'Setas'.tr,
                style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {
                Get.back(result: SetWallpaperas.Home);
                notification();
              },
              title: Text(
                'HomeScreen'.tr,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Get.back(result: SetWallpaperas.Lock);
                notification();
              },
              title: Text(
                'LockScreen'.tr,
                style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 20),
              ),
            ),
            ListTile(
              onTap: () {
                Get.back(result: SetWallpaperas.Both);
                notification();
              },
              title: Text(
                'Both'.tr,
                style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 20),
              ),
            )
          ],
        );
      },
    );
