import 'package:flutter/material.dart';
import 'package:tech/constants.dart';
import 'package:tech/core/utils/app_router.dart';
import 'package:tech/features/home_screen/presentation/views/single_product_view.dart';
import 'package:tech/features/home_screen/presentation/views/widgets/rating_row.dart';

class ProductsGridViewItem extends StatelessWidget {
  const ProductsGridViewItem({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.price,
    required this.description,
    required this.brand, required this.id,
  }) : super(key: key);
  final String imagePath;
  final String title;
  final String description;
  final String brand;
  final double rating;
  final int price;
  final int id;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppRouter.push(
            context: context,
            secondRoute: SingleProductView(
              title: title,
              thumbnail: imagePath,
              price: price,
              rating: rating,
              description: description,
              brand: brand,
              id: id,
            ));
      },
      child: Container(
        width: 100,
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              spreadRadius: 0.1,
              blurRadius: 8,
              color: Colors.grey,
              offset: Offset(5, 5))
        ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                imagePath,
                height: 120,
              ),
              Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RatingRow(rating: rating),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "EGP $price",
                        style: const TextStyle(
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
