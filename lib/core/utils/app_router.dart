import 'package:flutter/material.dart';

class AppRouter {
  static void push(
      {required BuildContext context, required Widget secondRoute}) {
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => secondRoute)));
  }

  static void pushReplacement(
      {required BuildContext context, required Widget secondRoute}) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => secondRoute)));
  }

  static void pushAndRemoveUntil(
      {required BuildContext context, required Widget secondRoute}) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: ((context) => secondRoute)),
        ((route) => false));
  }

  static void pop({required BuildContext context}) {
    Navigator.pop(context);
  }
}
