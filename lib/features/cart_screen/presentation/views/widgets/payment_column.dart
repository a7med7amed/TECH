import 'package:flutter/material.dart';
import 'package:tech/core/widgets/custom_button.dart';

import '../../../../../constants.dart';
import '../../view_models/cubit/cart_cubit.dart';

class PaymentColumn extends StatelessWidget {
  const PaymentColumn({super.key, required this.cubit});
  final CartCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 2,
          width: double.infinity,
          color: Colors.grey,
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Total",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "EGP ${cubit.totalPrice}",
              style: const TextStyle(
                  color: mainColor, fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        CustomButton(
          text: "Order Now",
          onTap: () {
          },
        )
      ],
    );
  }
}
