import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tech/core/utils/app_router.dart';
import 'package:tech/features/home_screen/data/models/device_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.dio) : super(CartInitial());
  late List<String> ids;
  final Dio dio;
  List<DeviceModel> devices = [];
  List<DeviceModel> cartItems = [];
  int totalPrice = 0;
  late SharedPreferences preferences;

  Future<void> init() async {
    emit(LoadingState());
    preferences = await SharedPreferences.getInstance();
    await fetchDevices();
    await getIds();
    getCartItems();
    calculateTotalPrice();
    emit(CartInitial());
  }

  Future<void> getIds() async {
    if (preferences.getStringList("cartItems") == null) {
      ids = ["5", "8"];
    } else {
      ids = preferences.getStringList("cartItems")!;
    }
  }

  Future<void> fetchDevices() async {
    try {
      var response =
          await dio.get("https://api.npoint.io/f5976d27c2ac9516ee47");
      var data = response.data;
      for (var item in data['devices']) {
        devices.add(DeviceModel.fromMap(item));
      }
      devices.shuffle();
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  void calculateTotalPrice() {
    totalPrice = 0;
    for (var item in cartItems) {
      totalPrice += item.price!.toInt();
    }
  }

  void getCartItems() {
    for (var item in devices) {
      for (String item1 in ids) {
        if (item.id == int.parse(item1)) {
          cartItems.add(item);
        }
      }
    }
  }

  Future<void> addToCart(
      {required int id, required BuildContext context}) async {
    emit(LoadingState());
    for (var item in devices) {
      if (item.id == id) {
        cartItems.add(item);
      }
    }
    calculateTotalPrice();
    emit(CartInitial());
    AppRouter.pop(context: context);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        "Your Product Added to Cart Successfully!",
      ),
      backgroundColor: Colors.green,
    ));
    ids.add(id.toString());
    preferences.setStringList("cartItems", ids);
  }

  Future<void> deleteFromCart({required int id}) async {
    emit(LoadingState());
    for (var item in cartItems) {
      if (item.id == id) {
        totalPrice -= item.price!.toInt();
      }
    }
    cartItems.removeWhere((item) => item.id == id);
    emit(CartInitial());
    ids.removeWhere((item) => item == id.toString());
    preferences.setStringList("cartItems", ids);
  }
}
