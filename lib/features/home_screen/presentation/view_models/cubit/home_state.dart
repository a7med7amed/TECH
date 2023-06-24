part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadingState extends HomeState {}
class MobilesState extends HomeState {
  final List<DeviceModel> devices;

  MobilesState({required this.devices});
}
class TabletsState extends HomeState {
  final List<DeviceModel> devices;

  TabletsState({required this.devices});
}
class MonitorsState extends HomeState {
  final List<DeviceModel> devices;

  MonitorsState({required this.devices});
}
class HeadphonesState extends HomeState {
  final List<DeviceModel> devices;

  HeadphonesState({required this.devices});
}
class SmartWatchesState extends HomeState {
  final List<DeviceModel> devices;

  SmartWatchesState({required this.devices});
}
class LaptopsState extends HomeState {
  final List<DeviceModel> devices;

  LaptopsState({required this.devices});
}
class SearchSuccessState extends HomeState{
  final List<DeviceModel> devices;

  SearchSuccessState({required this.devices});
}
class SearchNotFoundState extends HomeState{}
class SideBarState extends HomeState{}
