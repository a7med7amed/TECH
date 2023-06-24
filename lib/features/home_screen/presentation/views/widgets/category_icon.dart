import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({
    Key? key,
    this.iconData,
    required this.categoryName,
    this.svgPath,
    this.svgWidth,
    required this.spaces, required this.selectionCondition, this.onTap,
  }) : super(key: key);
  final bool selectionCondition;
  final IconData? iconData;
  final String? svgPath;
  final double? svgWidth;
  final String categoryName;
  final String spaces;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(color: Colors.grey, spreadRadius: 0.1, blurRadius: 10)
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 15,
            ),
            iconData != null
                ? Icon(
                    iconData,
                    color: selectionCondition ? const Color(0xffCF5B44) : Colors.black,
                  )
                : SvgPicture.asset(
                    svgPath!,
                    width: svgWidth,
                    color: selectionCondition ? const Color(0xffCF5B44) : Colors.black,
                  ),
            Text(
              "$spaces$categoryName",
              style: TextStyle(
                  color: selectionCondition ? const Color(0xffCF5B44) : Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }
}
