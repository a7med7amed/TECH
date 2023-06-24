import 'package:flutter/material.dart';
import 'package:tech/constants.dart';
import 'package:tech/core/widgets/pop_button.dart';
import 'package:tech/features/home_screen/presentation/views/widgets/rating_row.dart';

class SingleProductViewBody extends StatelessWidget {
  const SingleProductViewBody(
      {super.key,
      required this.title,
      required this.description,
      required this.brand,
      required this.thumbnail,
      required this.rating,
      required this.price});
  final String title;
  final String description;
  final String brand;
  final String thumbnail;
  final double rating;
  final int price;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white,
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: double.infinity,
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 60, left: 30, right: 30),
                    child: Image.network(
                      thumbnail,
                      height: 300,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: 270,
                                    child: Text(
                                      title,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    )),
                                const RatingRow(
                                  rating: 4.5,
                                  isSingleProduct: true,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: double.infinity,
                                ),
                                Text("Brand: $brand",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(
                                            255, 106, 106, 106))),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text("EGP $price",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: mainColor)),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text("Description:",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(description,
                                    style: const TextStyle(
                                        fontSize: 15.5, color: Colors.white)),
                                const SizedBox(
                                  height: 40,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Positioned(top: 50, left: 30, child: PopButton()),
            ],
          ),
        )
      ],
    );
  }
}
