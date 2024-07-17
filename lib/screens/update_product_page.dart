import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/Services/put_update_product.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/custom_putton.dart';
import 'package:store_app/widgets/custom_test_filed.dart';

// ignore: must_be_immutable
class UdateProductPage extends StatefulWidget {
  const UdateProductPage({super.key});

  static String id = 'UdateProductPage';

  @override
  State<UdateProductPage> createState() => _UdateProductPageState();
}

class _UdateProductPageState extends State<UdateProductPage> {
  String? title, description, image, price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: Colors.black,
          title: const Text(
            'UpdateProduct',
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 110,
                ),
                CustomTextField(
                  onChange: (data) {
                    title = data;
                  },
                  hint: 'Product name',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChange: (data) {
                    description = data;
                  },
                  hint: 'Discreption',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  inputType: TextInputType.number,
                  onChange: (data) {
                    price = data;
                  },
                  hint: 'Price',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChange: (data) {
                    image = data;
                  },
                  hint: 'Image',
                ),
                const SizedBox(
                  height: 50,
                ),
                CusttomButtonPage(
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);
                      snackBar(text: 'Sucess');
                      // ignore: use_build_context_synchronously
                    } catch (e) {
                      snackBar(text: e.toString());
                      log(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                    // ignore: use_build_context_synchronously
                  },
                  text: 'Update',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void snackBar({required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductServices().updateProduct(
        title: title == null ? product.title : title!,
        price: price == null ? product.price : price!,
        description: description == null ? product.description : description!,
        image: image == null ? product.image : image!,
        category: product.category,
        id: product.id);
  }
}
