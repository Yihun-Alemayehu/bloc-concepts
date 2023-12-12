import 'package:bloc_concepts/logic/cubit/counter_cubit.dart';
import 'package:bloc_concepts/logic/cubit/internet_cubit.dart';
import 'package:bloc_concepts/presentation/routes/app_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(
    appRoute: AppRoute(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRoute appRoute;
  final Connectivity connectivity;

  const MyApp({super.key, required this.appRoute, required this.connectivity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => InternetCubit(connectivity: connectivity))
      ],
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: _appRoute.onGenerateRoute,
      ),
    );
  }
}
