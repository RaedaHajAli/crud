// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crud/cubits/product_cubit.dart';
import 'package:crud/models/product_request.dart';
import 'package:flutter/material.dart';

import 'package:crud/views/widgets/custom_button.dart';
import 'package:crud/views/widgets/custom_textfield.dart';

class AddingBottomSheet extends StatefulWidget {
  const AddingBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<AddingBottomSheet> createState() => _AddingBottomSheetState();
}

class _AddingBottomSheetState extends State<AddingBottomSheet> {
  TextEditingController titleController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    ProductCubit cubit = ProductCubit.get(context);
    return Padding(
      padding: EdgeInsets.only(
          left: 8,
          right: 8,
          top: 12,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              controller: titleController,
              hint: 'Product Title',
              maxLines: 1,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
                text: 'Add',
                onTap: () {
                  // adding when tabbing add button
                  if (formKey.currentState!.validate()) {
                    cubit.addProduct(
                        request: ProductRequest(
                      title: titleController.text,
                    ));
                    Navigator.pop(context);
                  }
                }),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
