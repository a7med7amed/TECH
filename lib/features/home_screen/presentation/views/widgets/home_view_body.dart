import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech/constants.dart';
import 'package:tech/core/utils/app_router.dart';
import 'package:tech/core/widgets/loading_widget.dart';
import 'package:tech/features/cart_screen/presentation/view_models/cubit/cart_cubit.dart'
    as cart;
import 'package:tech/features/cart_screen/presentation/views/cart_view.dart';
import 'package:tech/features/home_screen/presentation/view_models/cubit/home_cubit.dart';
import 'package:tech/features/home_screen/presentation/views/widgets/category_icon.dart';
import 'package:tech/features/home_screen/presentation/views/widgets/product_grid_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.barsOnPressed});
  final void Function()? barsOnPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(builder: ((context, state) {
        var cubit = BlocProvider.of<HomeCubit>(context);
        var cartCubit = BlocProvider.of<cart.CartCubit>(context);
        if (state is LoadingState) {
          return const LoadingWidget();
        }
        return SingleChildScrollView(
          physics: cubit.isSideBar
              ? const NeverScrollableScrollPhysics()
              : const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      !cubit.isSideBar
                      ?
                      IconButton(
                        onPressed: barsOnPressed,
                        icon: const Icon(
                          FontAwesomeIcons.bars,
                          color: mainColor,
                          size: 25,
                        ),
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                      )
                      :const SizedBox(width: 20,),
                      Image.asset(
                        "assets/logo.png",
                        height: 30,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              AppRouter.push(
                                  context: context, secondRoute: const CartView());
                            },
                            icon: const Icon(
                              FontAwesomeIcons.cartShopping,
                              color: mainColor,
                              size: 25,
                            ),
                            constraints: const BoxConstraints(),
                            padding: EdgeInsets.zero,
                          ),
                          cartCubit.cartItems.isNotEmpty
                              ? Positioned(
                                  top: -10,
                                  right: -12,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 9,
                                    child: Text(
                                      cartCubit.cartItems.length.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  ))
                              : const SizedBox()
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                      height: 45,
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                          spreadRadius: 0.01,
                          blurRadius: 15,
                          offset: Offset(5, 5),
                          color: Color.fromARGB(255, 209, 209, 209),
                        )
                      ]),
                      child: TextField(
                        onChanged: (value) {
                          cubit.search(value);
                        },
                        decoration: InputDecoration(
                          suffixIcon: const Padding(
                            padding: EdgeInsets.only(right: 12.0),
                            child: Icon(
                              FontAwesomeIcons.magnifyingGlass,
                              color: Color.fromARGB(255, 78, 78, 78),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                state is SearchSuccessState
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        child: ProductGridView(cubit: cubit, state: state),
                      )
                    : state is SearchNotFoundState
                        ? Center(
                            child: Container(
                                height: 500,
                                alignment: Alignment.center,
                                child: const Text(
                                  "Does not match any results!",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )),
                          )
                        : Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Container(
                                  width: double.infinity,
                                  height: 170,
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(colors: [
                                        Color.fromARGB(255, 144, 79, 194),
                                        Color.fromARGB(255, 123, 202, 255)
                                      ]),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height: 130,
                                        width: 110,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                53, 255, 255, 255),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: SizedBox(
                                            width: 68,
                                            child: Text(
                                              "50% OFF",
                                              textAlign: TextAlign.center,
                                              style:
                                                  GoogleFonts.exo2().copyWith(
                                                fontSize: 33,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                shadows: [
                                                  const Shadow(
                                                      color: Colors.black,
                                                      blurRadius: 5,
                                                      offset: Offset(1, 2))
                                                ],
                                              ),
                                            )),
                                      ),
                                      Image.asset(
                                        "assets/iphone.png",
                                        width: 100,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 25, right: 20, left: 20, bottom: 12),
                                  child: Row(
                                    children: [
                                      CategoryIcon(
                                        categoryName: "All",
                                        iconData: FontAwesomeIcons.grip,
                                        selectionCondition: cubit.isAll,
                                        spaces: " ",
                                        onTap: () => cubit.displayAll(),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      CategoryIcon(
                                        categoryName: "Laptops",
                                        iconData: FontAwesomeIcons.laptop,
                                        selectionCondition: cubit.isLaptops,
                                        spaces: "   ",
                                        onTap: () => cubit.displayLaptops(),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      CategoryIcon(
                                        categoryName: "Mobiles",
                                        iconData: FontAwesomeIcons.mobileScreen,
                                        selectionCondition: cubit.isMobiles,
                                        spaces: " ",
                                        onTap: () {
                                          cubit.displayMobiles();
                                        },
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      CategoryIcon(
                                        categoryName: "Smart Watches",
                                        selectionCondition:
                                            cubit.isSmartwatches,
                                        svgPath: "assets/smart_watch.svg",
                                        svgWidth: 32,
                                        spaces: " ",
                                        onTap: () =>
                                            cubit.displaySmartwatches(),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      CategoryIcon(
                                        categoryName: "Monitors",
                                        selectionCondition: cubit.isMonitors,
                                        iconData: FontAwesomeIcons.tv,
                                        svgWidth: 32,
                                        spaces: "    ",
                                        onTap: () => cubit.displayMonitors(),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      CategoryIcon(
                                        categoryName: "Tablets",
                                        selectionCondition: cubit.isTablets,
                                        iconData:
                                            FontAwesomeIcons.tabletScreenButton,
                                        svgWidth: 32,
                                        spaces: "  ",
                                        onTap: () => cubit.displayTablets(),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      CategoryIcon(
                                        categoryName: "Headphones",
                                        selectionCondition: cubit.isHeadphones,
                                        iconData: FontAwesomeIcons.headphones,
                                        svgWidth: 32,
                                        spaces: "  ",
                                        onTap: () => cubit.displayHeadphones(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 20),
                                child: ProductGridView(
                                  cubit: cubit,
                                  state: state,
                                ),
                              ),
                            ],
                          )
              ],
            ),
          ),
        );
      })),
    );
  }
}
