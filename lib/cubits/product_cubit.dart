import 'package:crud/cubits/product_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';
import '../helper/dio_helper.dart';
import '../models/product_data_model.dart';
import '../models/product_model.dart';
import '../models/product_request.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductIntialState());
  static ProductCubit get(context) => BlocProvider.of(context);

  List<ProductModel> products = [];
  Map<int, ProductModel> localProducts = {};

  addProduct({required ProductRequest request}) async {
    DioHelper.postData(url: addProductEndPoint, data: {
      'title': request.title,
    }).then((value) {
      print(value.data);
      ProductModel newProduct = ProductModel.fromJson(value.data);

      localProducts.addAll({newProduct.id: newProduct});
      products.add(newProduct);

      emit(ProductAddSuccessState());
      //todo when use a real api we should call this method to refresh products list
    
     //but now the adding  operation executes on another list of products
     // just in id:101
     // getAllProducts();
    }).catchError((e) {
      debugPrint(e.toString());
      emit(ProductAddFailureState());
    });
  }

  editProduct({required ProductRequest request, required int id}) {
    DioHelper.putData(url: '$editProductEndPoint$id', data: {
      'title': request.title,
    }).then((value) {
      print(value.data);

      localProducts[id]?.title = request.title; // the product in products list

      emit(ProductEditSuccessState());
      //todo when use a real api we should call this method to refresh products list
      //but now the editting  operation executes on another list of products
      // getAllProducts();
    }).catchError((e) {
      debugPrint(e.toString());
      emit(ProductEditFailureState());
    });
  }

  deleteProduct(int id) {
    DioHelper.deleteData(url: '$deteteProductEndPoint$id').then((value) {
      print(value);
      //we need the index of deleted product
      int productDeletedIndex = products.indexOf(localProducts[id]!, 0);
      products.removeAt(productDeletedIndex);

      emit(ProductDeleteSuccessState());
      //todo when use a real api we should call this method to refresh products list
      //but now the deleting from  another list of products
      // getAllProducts();
    }).catchError((e) {
      print(e.toString());
      emit(ProductDeleteFailureState());
    });
  }

  getAllProducts() {
    DioHelper.getData(url: getAllProductsEndPoint).then((value) {
      print(value);
      products = [];

      ProductDataModel dataModel = ProductDataModel.fromJson(value.data);
      products = dataModel.products;
      products.forEach(
        (element) {
          localProducts.addAll({
            element.id: element,
          });
        },
      );

      emit(ProductGetAllSuccessState());
    }).catchError((e) {
      print(' *** Error${e.toString()}');
      emit(ProductGetAllFailureState());
    });
  }

  
}
