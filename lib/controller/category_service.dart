import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/constants.dart';
import '../models/models.dart';

class CategoryImageServices {
  List<ImageModel> categoryImages = [];

  Future<List<ImageModel>> fetchimage({required String query, required int page, required int limit}) async {
    final response = await http.get(Uri.parse('https://api.pexels.com/v1/search?query=$query?per_page=$limit&page=$page'), headers: {'Authorization': token});

    if (response.statusCode == 200) {
      final decode = utf8.decode(response.bodyBytes);
      final responseJson = jsonDecode(decode);
      for (final Map a in responseJson['photos']) {
        categoryImages.add(ImageModel.fromJson(a));
      }
      print(categoryImages);
      // categoryImages.shuffle();
      return categoryImages;
    } else {
      return [];
    }
  }
}
