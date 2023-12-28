// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  int id;
  String title;
  String description;
  dynamic price;
  String? image;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        title: json['title'],
        description: json['description'] ?? '', price: json['price']?? 'Not avaliable', image: json['thumbnail']??null);
  }
}
