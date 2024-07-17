import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product_page.dart';

class CustomStakeCard extends StatelessWidget {
  const CustomStakeCard({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UdateProductPage.id,
            arguments: productModel);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            // width: 230,
            // height: 160,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 50.0,
                  color: Colors.grey.withOpacity(.0000005),
                  spreadRadius: 0.0,
                  offset: const Offset(10.0, 10.0))
            ]),
            child: Card(
              elevation: 10.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModel.title.substring(0, 8),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$ ${productModel.price}',
                          style: const TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 18.0,
            top: -50.0,
            child: Image.network(
              productModel.image,
              height: 100.0,
              width: 100.0,
            ),
          )
        ],
      ),
    );
  }
}
