// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crud/models/product_model.dart';

class ProductDataModel {
  List<ProductModel> products = [];
  ProductDataModel({
    required this.products,
  });
  ProductDataModel.fromJson(Map<String, dynamic> json) {
    json['products'].forEach((e) {
      products.add(ProductModel.fromJson(e));
    });
  }
}
