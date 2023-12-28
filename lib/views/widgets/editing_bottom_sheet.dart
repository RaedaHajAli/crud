// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crud/models/product_request.dart';
import 'package:crud/models/product_model.dart';
import 'package:flutter/material.dart';

import 'package:crud/views/widgets/custom_button.dart';
import 'package:crud/views/widgets/custom_textfield.dart';

import '../../cubits/product_cubit.dart';

class EditingBottomSheet extends StatefulWidget {
  const EditingBottomSheet({Key? key, required this.model}) : super(key: key);

  final ProductModel model;

  @override
  State<EditingBottomSheet> createState() => _EditingBottomSheetState();
}

class _EditingBottomSheetState extends State<EditingBottomSheet> {
  TextEditingController titleController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    titleController.text = widget.model.title;
  }

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
              maxLines: 1,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
                text: 'Edit',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    cubit.editProduct(
                        request: ProductRequest(
                          title: titleController.text,
                        ),
                        id: widget.model.id);
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
