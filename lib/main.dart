import 'package:bloc_concepts/logic/cubit/counter_cubit.dart';
import 'package:bloc_concepts/presentation/screens/home_screen.dart';
import 'package:bloc_concepts/presentation/screens/second_screen.dart';
import 'package:bloc_concepts/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => BlocProvider.value(
                value: _counterCubit,
                child: const HomeScreen(
                  title: 'C O U N T E R   U S I N G   C U B I T',
                  color: Colors.blueAccent,
                ),
              ),
          'SecondScreen': (context) => BlocProvider.value(
                value: _counterCubit,
                child: const SecondScreen(
                  title: 'S E C O N D   S C R E E N',
                  color: Colors.deepPurple,
                ),
              ),
          'ThirdScreen': (context) => BlocProvider.value(
                value: _counterCubit,
                child: const ThirdScreen(
                  title: 'T H I R D   S C R E E N',
                  color: Colors.deepOrange,
                ),
              ),
        },
      ),
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}
