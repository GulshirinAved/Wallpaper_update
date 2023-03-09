import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../constants/constants.dart';
import '../controller/category_service.dart';
import '../models/models.dart';
import '../widgets/widget.dart';
import 'category_profile.dart';

class ShowAllImages extends StatefulWidget {
  final String pageName;
  final String query;

  const ShowAllImages({
    Key? key,
    required this.pageName,
    required this.query,
  }) : super(key: key);

  @override
  State<ShowAllImages> createState() => _ShowAllImagesState();
}

class _ShowAllImagesState extends State<ShowAllImages> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  int page = 1;

  List<ImageModel> products = [];

  final RefreshController refreshController = RefreshController(initialRefresh: false);

  Future<void> getData() async {
    print(products);

    await CategoryImageServices().fetchimage(query: widget.query, page: page, limit: 15).then((value) {
      products += value;
      print(value);
      setState(() {});
      print(products);
    });
  }

  void _onRefresh() {
    Future.delayed(const Duration(milliseconds: 1000));
    refreshController.refreshCompleted();
    products.clear();
    page = 1;

    getData();
  }

  void _onLoading() {
    Future.delayed(const Duration(milliseconds: 1000));
    refreshController.loadComplete();

    page += 1;
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: SmartRefresher(
        footer: footer(),
        controller: refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        enablePullDown: true,
        enablePullUp: true,
        header: const MaterialClassicHeader(
          color: kblueColor,
        ),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return imageCard(index);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 3),
        ),
      ),
    );
  }

  GestureDetector imageCard(int index) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => CategoryProfile(
            url: products[index].portraits!,
            index: index,
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          placeholder: (context, url) {
            return loading();
          },
          imageUrl: products[index].hits!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  AppBar appbar(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Get.back();
          CategoryImageServices().categoryImages.clear();
        },
        icon: Icon(
          IconlyLight.arrowLeftCircle,
          color: Theme.of(context).colorScheme.secondary,
          size: 30,
        ),
      ),
      elevation: 1,
      title: Text(
        widget.pageName.tr,
        style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: fontsize27, fontFamily: fontstyleGilroyBold),
      ),
    );
  }
}
