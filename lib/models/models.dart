class ImageModel {
  String? hits;
  String? portraits;
  ImageModel({this.hits, this.portraits});
  factory ImageModel.fromJson(Map<dynamic, dynamic> json) => ImageModel(hits: json['src']['medium'], portraits: json['src']['portrait']);
}
