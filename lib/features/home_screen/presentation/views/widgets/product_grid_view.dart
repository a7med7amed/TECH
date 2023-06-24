import 'package:flutter/material.dart';
import 'package:tech/features/home_screen/presentation/views/widgets/product_grid_view_item.dart';

import '../../view_models/cubit/home_cubit.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    Key? key,
    required this.cubit,
    required this.state,
  }) : super(key: key);

  final HomeCubit cubit;
  final state;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height/1.05)),
      itemBuilder: ((context, index) {
        return ProductsGridViewItem(
          title: state is MobilesState
              ? state.devices[index].title!
              : state is TabletsState
                  ? state.devices[index].title!
                  : state is LaptopsState
                      ? state.devices[index].title!
                      : state is SmartWatchesState
                          ? state.devices[index].title!
                          : state is HeadphonesState
                              ? state.devices[index].title!
                              : state is MonitorsState
                                  ? state.devices[index].title!
                                  : state is SearchSuccessState
                                      ? state.devices[index].title!
                                      : cubit.devices[index].title!,
          imagePath: state is MobilesState
              ? state.devices[index].thumbnail!
              : state is TabletsState
                  ? state.devices[index].thumbnail!
                  : state is LaptopsState
                      ? state.devices[index].thumbnail!
                      : state is SmartWatchesState
                          ? state.devices[index].thumbnail!
                          : state is HeadphonesState
                              ? state.devices[index].thumbnail!
                              : state is MonitorsState
                                  ? state.devices[index].thumbnail!
                                  : state is SearchSuccessState
                                      ? state.devices[index].thumbnail!
                                      : cubit.devices[index].thumbnail!,
          rating: state is MobilesState
              ? state.devices[index].rating!
              : state is TabletsState
                  ? state.devices[index].rating!
                  : state is LaptopsState
                      ? state.devices[index].rating!
                      : state is SmartWatchesState
                          ? state.devices[index].rating!
                          : state is HeadphonesState
                              ? state.devices[index].rating!
                              : state is MonitorsState
                                  ? state.devices[index].rating!
                                  : state is SearchSuccessState
                                      ? state.devices[index].rating!
                                      : cubit.devices[index].rating!,
          price: state is MobilesState
              ? state.devices[index].price!
              : state is TabletsState
                  ? state.devices[index].price!
                  : state is LaptopsState
                      ? state.devices[index].price!
                      : state is SmartWatchesState
                          ? state.devices[index].price!
                          : state is HeadphonesState
                              ? state.devices[index].price!
                              : state is MonitorsState
                                  ? state.devices[index].price!
                                  : state is SearchSuccessState
                                      ? state.devices[index].price!
                                      : cubit.devices[index].price!,
          description: state is MobilesState
              ? state.devices[index].description!
              : state is TabletsState
                  ? state.devices[index].description!
                  : state is LaptopsState
                      ? state.devices[index].description!
                      : state is SmartWatchesState
                          ? state.devices[index].description!
                          : state is HeadphonesState
                              ? state.devices[index].description!
                              : state is MonitorsState
                                  ? state.devices[index].description!
                                  : state is SearchSuccessState
                                      ? state.devices[index].description!
                                      : cubit.devices[index].description!,
          brand: state is MobilesState
              ? state.devices[index].brand!
              : state is TabletsState
                  ? state.devices[index].brand!
                  : state is LaptopsState
                      ? state.devices[index].brand!
                      : state is SmartWatchesState
                          ? state.devices[index].brand!
                          : state is HeadphonesState
                              ? state.devices[index].brand!
                              : state is MonitorsState
                                  ? state.devices[index].brand!
                                  : state is SearchSuccessState
                                      ? state.devices[index].brand!
                                      : cubit.devices[index].brand!,
          id: state is MobilesState
              ? state.devices[index].id!
              : state is TabletsState
                  ? state.devices[index].id!
                  : state is LaptopsState
                      ? state.devices[index].id!
                      : state is SmartWatchesState
                          ? state.devices[index].id!
                          : state is HeadphonesState
                              ? state.devices[index].id!
                              : state is MonitorsState
                                  ? state.devices[index].id!
                                  : state is SearchSuccessState
                                      ? state.devices[index].id!
                                      : cubit.devices[index].id!,
        );
      }),
      itemCount: state is HomeInitial
          ? cubit.devices.length
          : state is SearchSuccessState
              ? state.devices.length
              : 8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
