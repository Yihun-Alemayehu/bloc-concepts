import 'package:bloc_concepts/logic/cubit/counter_cubit.dart';
import 'package:test/test.dart';

void main() {
  group(
    "CounterCubit",
    () {
      CounterCubit counterCubit;
      counterCubit = CounterCubit();

      setUp(
        () {
          counterCubit = CounterCubit();
        },
      );

      tearDown(
        () {
          counterCubit = CounterCubit();
          counterCubit.close();
        },
      );

      test("Initial state test", () {

        expect(counterCubit.state,
            CounterState(counterValue: 0, wasIncremented: false));
      });
    },
  );
}
