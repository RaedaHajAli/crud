import 'package:crud/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';
import '../cubits/product_cubit.dart';
import '../cubits/product_states.dart';
import '../helper/methods.dart';
import 'widgets/adding_bottom_sheet.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductStates>(
      listener: (context, state) {
        if (state is ProductAddSuccessState) {
          buildSnackBar(context,
              msg: 'Adding product has been done successfully',
              color: kSuccessColor);
        }
        if (state is ProductAddFailureState) {
          buildSnackBar(context,
              msg: 'Adding product failed', color: kErrorColor);
        }

        if (state is ProductEditSuccessState) {
          buildSnackBar(context,
              msg: 'Editing product has been done successfully',
              color: kSuccessColor);
        }
        if (state is ProductEditFailureState) {
           buildSnackBar(context,
              msg: 'Editing product failed',
              color: kErrorColor);
         
        }
        if (state is ProductDeleteSuccessState) {
          buildSnackBar(context,
              msg: 'Deleting product has been done successfully',
              color: kSuccessColor);
        }
        if (state is ProductDeleteFailureState) {
           buildSnackBar(context,
              msg: 'Deleting product failed',
              color: kErrorColor);
          
        }
        if (state is ProductGetAllFailureState) {
           buildSnackBar(context,
              msg: 'Something went wrong',
              color: kErrorColor);
          
        }
      },
      builder: (context, state) {
        ProductCubit cubit = ProductCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('City Market'),
            centerTitle: true,
            elevation: 0,
          ),
          body: cubit.products.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ))
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return ProductItem(
                      productModel: cubit.products[index],
                    );
                  },
                  itemCount: cubit.products.length,
                ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: kPrimaryColor,
            onPressed: () {
              // show adding bottom sheet when tabbing FAB
              buildShowModalSheet(context,
                  bottomSheet: const AddingBottomSheet());
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
