import 'package:flutter/material.dart';
import 'package:store_app/Services/get_all_product.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/cutom_stack_crad.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 70,
        bottom: 16,
      ),
      child: FutureBuilder(
        future: GetAllProductServices().getAllProducts(),
        builder: (context, snapshot) {
          // ignore: avoid_print
          print((snapshot.error));
          if (snapshot.hasData) {
            List<ProductModel> product = snapshot.data!;
            return GridView.builder(
              itemCount: product.length,
              clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 100.0, // Change 100 to 100.0
              ),
              itemBuilder: (BuildContext context, int index) {
                return CustomStakeCard(
                  productModel: product[index],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
