import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({
    Key? key,
    required this.rating, this.isSingleProduct,
  }) : super(key: key);

  final double rating;
  final bool? isSingleProduct;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.amber,
          size: isSingleProduct != null ? 24 : 16,
        ),
        const SizedBox(
          width: 6,
        ),
        Text("/ $rating", style: isSingleProduct != null ? const TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white): null,)
      ],
    );
  }
}
