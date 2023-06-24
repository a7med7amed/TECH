import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../data/models/device_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.dio) : super(HomeInitial());
  final Dio dio;
  List<DeviceModel> devices = [];
  List<DeviceModel> laptops = [];
  List<DeviceModel> mobiles = [];
  List<DeviceModel> monitors = [];
  List<DeviceModel> headphones = [];
  List<DeviceModel> smartwatches = [];
  List<DeviceModel> tablets = [];
  bool isAll = true;
  bool isMobiles = false;
  bool isTablets = false;
  bool isLaptops = false;
  bool isMonitors = false;
  bool isSmartwatches = false;
  bool isHeadphones = false;

  bool isSideBar = false;
  Future<void> init() async {
    emit(LoadingState());
    await fetchDevices();
    sortDevices();
    emit(HomeInitial());
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

  void sortDevices() {
    for (var item in devices) {
      if (item.type == "phone") {
        mobiles.add(item);
      } else if (item.type == "tv") {
        monitors.add(item);
      } else if (item.type == "laptop") {
        laptops.add(item);
      } else if (item.type == "headphones") {
        headphones.add(item);
      } else if (item.type == "smartwatches") {
        smartwatches.add(item);
      } else {
        tablets.add(item);
      }
    }
  }

  void displayAll() {
    isAll = true;
    isMobiles = false;
    isTablets = false;
    isLaptops = false;
    isMonitors = false;
    isSmartwatches = false;
    isHeadphones = false;
    emit(HomeInitial());
  }

  void displayMobiles() {
    isAll = false;
    isMobiles = true;
    isTablets = false;
    isLaptops = false;
    isMonitors = false;
    isSmartwatches = false;
    isHeadphones = false;
    emit(MobilesState(devices: mobiles));
  }

  void displayTablets() {
    isAll = false;
    isMobiles = false;
    isTablets = true;
    isLaptops = false;
    isMonitors = false;
    isSmartwatches = false;
    isHeadphones = false;
    emit(TabletsState(devices: tablets));
  }

  void displayLaptops() {
    isAll = false;
    isMobiles = false;
    isTablets = false;
    isLaptops = true;
    isMonitors = false;
    isSmartwatches = false;
    isHeadphones = false;
    emit(LaptopsState(devices: laptops));
  }

  void displayMonitors() {
    isAll = false;
    isMobiles = false;
    isTablets = false;
    isLaptops = false;
    isMonitors = true;
    isSmartwatches = false;
    isHeadphones = false;
    emit(MonitorsState(devices: monitors));
  }

  void displayHeadphones() {
    isAll = false;
    isMobiles = false;
    isTablets = false;
    isLaptops = false;
    isMonitors = false;
    isSmartwatches = false;
    isHeadphones = true;
    emit(HeadphonesState(devices: headphones));
  }

  void displaySmartwatches() {
    isAll = false;
    isMobiles = false;
    isTablets = false;
    isLaptops = false;
    isMonitors = false;
    isSmartwatches = true;
    isHeadphones = false;
    emit(SmartWatchesState(devices: smartwatches));
  }

  void search(String text) {
    List<DeviceModel> filteredList = [];
    for (var item in devices) {
      if ((item.title!.toLowerCase().contains(text.toLowerCase()) ||
            item.type!.toLowerCase().contains(text.toLowerCase()) ||
            item.brand!.toLowerCase().contains(text.toLowerCase()))) {
        filteredList.add(item);
      }
    }
    if (text.isEmpty) {
      displayAll();
    } else if (filteredList.isNotEmpty) {
      emit(LoadingState());
      emit(SearchSuccessState(devices: filteredList));
    } else {
      emit(SearchNotFoundState());
    }
  }
  void emitSideBar(){
    isSideBar = !isSideBar;
    emit(SideBarState());
  }
  void emitIntial(){
    emit(HomeInitial());
  }
  void emitLoading(){
    emit(LoadingState());
  }
}
