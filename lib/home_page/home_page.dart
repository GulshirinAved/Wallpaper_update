import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../category/category_profile.dart';
import '../constants/constants.dart';
import '../controller/category_service.dart';
import '../models/models.dart';
import '../widgets/widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ktransparentColor,
      appBar: CustomAppBar(
        leading: false,
        name: 'home'.tr,
        elevation: false,
      ),
      body: FutureBuilder<List<ImageModel>>(
        future: CategoryImageServices().fetchimage(query: 'Random', page: 1, limit: 80),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return loading();
          } else if (snapshot.hasError) {
            return const Text('Error');
          } else if (!snapshot.hasData) {
            return const Text('empty');
          }
          return CarouselSlider.builder(
            itemCount: snapshot.data.length,
            options: CarouselOptions(
              height: screenHeight,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 8),
              viewportFraction: 1,
            ),
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => CategoryProfile(url: snapshot.data![index].portraits!, index: index));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: borderRadius20,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.background,
                        blurRadius: 4.5,
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 5,
                  ),
                  width: screenWidth,
                  child: ClipRRect(
                    borderRadius: borderRadius30,
                    child: CachedNetworkImage(
                      placeholder: (context, url) {
                        return loading();
                      },
                      imageUrl: snapshot.data[index].portraits,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
