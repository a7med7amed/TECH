import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../home_screen/presentation/view_models/cubit/home_cubit.dart';
import '../../../../home_screen/presentation/views/single_product_view.dart';
import '../../../../home_screen/presentation/views/widgets/rating_row.dart';
import '../../view_models/cubit/cart_cubit.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.price,
    required this.cartCubit,
    required this.id,
    required this.description,
    required this.thumbnail,
    required this.brand,
    required this.homeCubit,
  }) : super(key: key);
  final String imagePath;
  final String title;
  final double rating;
  final int price;
  final CartCubit cartCubit;
  final HomeCubit homeCubit;
  final int id;
  final String description;
  final String thumbnail;
  final String brand;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppRouter.push(
            context: context,
            secondRoute: SingleProductView(
                title: title,
                description: description,
                brand: brand,
                thumbnail: thumbnail,
                rating: rating,
                price: price,
                id: id));
      },
      child: Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(spreadRadius: 0.1, blurRadius: 8, color: Colors.grey)
              ],
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Image.network(
                  imagePath,
                  width: 130,
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 135,
                              child: Text(
                                title,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            RatingRow(rating: rating),
                            Text(
                              "EGP $price",
                              style: const TextStyle(
                                  color: mainColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: const Icon(FontAwesomeIcons.trash,
                                  size: 17, color: Colors.red),
                              onPressed: () {
                                cartCubit.deleteFromCart(id: id);
                                homeCubit.emitLoading();
                                homeCubit.emitIntial();
                              },
                              constraints: const BoxConstraints(),
                              padding: EdgeInsets.zero,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
