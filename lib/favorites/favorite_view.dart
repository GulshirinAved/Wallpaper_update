import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../category/category_profile.dart';
import '../constants/buttons/fav_button.dart';
import '../constants/constants.dart';
import '../controller/fav_controller.dart';
import '../widgets/widget.dart';

class Favorites extends StatefulWidget {
  const Favorites({
    Key? key,
  }) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final FavoriteController controller = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(leading: false, name: 'favorites'.tr, elevation: false),
      body: controller.products.isEmpty
          ? nolike()
          : Obx(
              () => GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.products.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return controller.products.isNotEmpty
                      ? Obx(
                          () => GestureDetector(
                            onTap: () {
                              Get.to(() => CategoryProfile(url: controller.products[index], index: index));
                            },
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: borderRadius20,
                                    boxShadow: [
                                      BoxShadow(
                                        color: kblackcolor.withOpacity(0.23),
                                        offset: const Offset(0, 10),
                                        blurRadius: 20,
                                      )
                                    ],
                                  ),
                                  margin: EdgeInsets.only(
                                    left: width8,
                                    right: width8,
                                    bottom: height15,
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  child: ClipRRect(
                                    borderRadius: borderRadius20,
                                    child: CachedNetworkImage(
                                      placeholder: (context, url) {
                                        return loading();
                                      },
                                      imageUrl: controller.products[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: width12,
                                  top: height4,
                                  child: Container(
                                    height: height43,
                                    width: width42,
                                    decoration: BoxDecoration(borderRadius: borderRadius20, color: Theme.of(context).scaffoldBackgroundColor),
                                    child: FavButton(index: index, url: controller.products[index], height: 220, width: 2),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      : const Text('Error');
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              ),
            ),
    );
  }
}
