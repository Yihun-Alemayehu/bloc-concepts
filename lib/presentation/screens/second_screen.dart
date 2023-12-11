import 'package:bloc_concepts/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({
    super.key,
    required this.title,
   required this.color,
  });

  final String title;
  final Color color;

  @override
  State<SecondScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  const SnackBar(
                    content: Text('Incremented'),
                    duration: Duration(seconds: 1),
                  );
                } else if (state.wasIncremented == false) {
                  const SnackBar(
                    content: Text('Decremented'),
                    duration: Duration(seconds: 1),
                  );
                }
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterCubit>().decrement();
                    //print();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'increment',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: widget.color,
              onPressed: () {},
              child: const Text('Go to second Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
