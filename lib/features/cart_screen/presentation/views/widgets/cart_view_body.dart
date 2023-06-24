import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech/core/widgets/loading_widget.dart';
import 'package:tech/features/cart_screen/presentation/view_models/cubit/cart_cubit.dart';
import 'package:tech/features/cart_screen/presentation/views/widgets/payment_column.dart';
import 'package:tech/features/home_screen/presentation/view_models/cubit/home_cubit.dart'
    as home;

import '../../../../../constants.dart';
import '../../../../../core/widgets/pop_button.dart';
import 'cart_item.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<CartCubit>(context);
        var homeCubit = BlocProvider.of<home.HomeCubit>(context);
        if (state is LoadingState) {
          return const LoadingWidget();
        }
        return Padding(
          padding: const EdgeInsets.only(bottom: 15, top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const PopButton(),
                          Text(
                            "My Cart",
                            style: GoogleFonts.chivo().copyWith(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: mainColor),
                          ),
                          const SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                    ),
                    cubit.cartItems.isNotEmpty
                        ? SizedBox(
                            height: 515,
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: ((context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      right: 30,
                                      left: 30,
                                      top: 15,
                                      bottom:
                                          index == cubit.cartItems.length - 1
                                              ? 15
                                              : 0),
                                  child: CartItem(
                                    title: cubit.cartItems[index].title!,
                                    imagePath:
                                        cubit.cartItems[index].thumbnail!,
                                    rating: cubit.cartItems[index].rating!,
                                    price: cubit.cartItems[index].price!,
                                    cartCubit: cubit,
                                    homeCubit: homeCubit,
                                    id: cubit.cartItems[index].id!,
                                    thumbnail:
                                        cubit.cartItems[index].thumbnail!,
                                    brand: cubit.cartItems[index].brand!,
                                    description:
                                        cubit.cartItems[index].description!,
                                  ),
                                );
                              }),
                              separatorBuilder: ((context, index) {
                                return const SizedBox(
                                  height: 20,
                                );
                              }),
                              itemCount: cubit.cartItems.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                            ),
                          )
                        : Expanded(
                            child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Your Cart is Empty",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "There is no products added to your cart to be displayed !",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color:
                                            Color.fromARGB(255, 116, 116, 116)),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ))
                  ],
                ),
              ),
              cubit.cartItems.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: PaymentColumn(cubit: cubit))
                  : const SizedBox()
            ],
          ),
        );
      },
    );
  }
}




