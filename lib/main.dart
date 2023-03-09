import 'package:Wallpaper/splashscreen.dart/splashscreen.dart';
import 'package:Wallpaper/theme/theme_service.dart';
import 'package:Wallpaper/theme/themes.dart';
import 'package:Wallpaper/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GetStorage storage = GetStorage();

    return GetMaterialApp(
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: ThemeService().getThemeMode(),
      home: const ConnectionCheckpage(),
      fallbackLocale: const Locale('en'),
      locale: storage.read('lancode') != null ? Locale(storage.read('lancode')) : const Locale('en'),
      translations: MyTranslations(),
      debugShowCheckedModeBanner: false,
    );
  }
}
