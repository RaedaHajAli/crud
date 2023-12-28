// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:crud/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/product_cubit.dart';
import '../../cubits/product_states.dart';
import '../../helper/methods.dart';
import 'editing_bottom_sheet.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    ProductCubit cubit = ProductCubit.get(context);
    return BlocBuilder<ProductCubit, ProductStates>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
         //   print(productModel.id);
            //show editing bottom sheet when tabbing on product
            buildShowModalSheet(context,
                bottomSheet: EditingBottomSheet(model: productModel));
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 150,
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                        child: productModel.image == null
                            ? const Center(child: CircularProgressIndicator())
                            : CachedNetworkImage(
                                imageUrl: productModel.image!,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                fit: BoxFit.fill,
                              )),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          productModel.title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          productModel.description,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.black87),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                           
                            Text(
                              '${productModel.price.toString()} \$',
                              style: const TextStyle(color: Colors.black87),
                            ),
                            IconButton(
                                onPressed: () {
                                  // deleting when tab delete icon
                                  cubit.deleteProduct(productModel.id);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
