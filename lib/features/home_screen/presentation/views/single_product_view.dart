import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech/features/cart_screen/presentation/view_models/cubit/cart_cubit.dart';
import 'package:tech/features/home_screen/presentation/view_models/cubit/home_cubit.dart';
import 'package:tech/features/home_screen/presentation/views/widgets/single_product_view_body.dart';

import '../../../../core/widgets/custom_button.dart';

class SingleProductView extends StatelessWidget {
  const SingleProductView(
      {super.key,
      required this.title,
      required this.description,
      required this.brand,
      required this.thumbnail,
      required this.rating,
      required this.price,
      required this.id});
  final String title;
  final String description;
  final String brand;
  final String thumbnail;
  final double rating;
  final int id;
  final int price;
  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    var cubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleProductViewBody(
        title: title,
        description: description,
        brand: brand,
        thumbnail: thumbnail,
        rating: rating,
        price: price,
      ),
      floatingActionButton: CustomButton(
          text: "Add To Cart",
          onTap: () {
            cartCubit.addToCart(id: id, context: context);
            cubit.emitLoading();
            cubit.emitIntial();
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
