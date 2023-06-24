import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech/constants.dart';
import 'package:tech/features/home_screen/presentation/view_models/cubit/home_cubit.dart';
import 'package:tech/features/home_screen/presentation/views/widgets/home_view_body.dart';
import 'package:tech/features/home_screen/presentation/views/widgets/side_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

late AnimationController animationController;
late Animation<double> animation;
late Animation<double> scaleAnimation;

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 300))
          ..addListener(() {
            setState(() {});
          });
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    scaleAnimation = Tween<double>(begin: 1, end: 0.9).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: sideBarColor,
            body: Stack(
              children: [
                Visibility(
                  visible: cubit.isSideBar,
                  child: AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.fastOutSlowIn,
                      left: cubit.isSideBar ? 0 : -288,
                      width: 288,
                      height: MediaQuery.of(context).size.height,
                      child: SideBar(
                        xOnPressed: () {
                          cubit.emitSideBar();
                          animationController.reverse();
                          cubit.displayAll();
                        },
                      )),
                ),
                Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(
                        animation.value - 30 * animation.value * pi / 180),
                  alignment: Alignment.center,
                  child: Transform.translate(
                      offset: Offset(animation.value * 288, 0),
                      child: Transform.scale(
                          scale: scaleAnimation.value,
                          child: HomeViewBody(
                            barsOnPressed: () {
                              cubit.emitSideBar();
                              animationController.forward();
                              cubit.displayAll();
                            },
                          ))),
                ),
              ],
            ));
      },
    );
  }
}
