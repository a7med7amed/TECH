import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech/features/cart_screen/presentation/view_models/cubit/cart_cubit.dart';
import 'package:tech/features/home_screen/presentation/view_models/cubit/home_cubit.dart';
import 'package:tech/features/home_screen/presentation/views/home_view.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => CartCubit(Dio())..init())),
        BlocProvider(
            create: ((context) => HomeCubit(Dio())..init()))
      ],
      child: MaterialApp(
        title: 'TECH',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

