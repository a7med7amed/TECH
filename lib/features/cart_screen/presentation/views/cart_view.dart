import 'package:flutter/material.dart';
import 'package:tech/features/cart_screen/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CartViewBody());
  }
}
