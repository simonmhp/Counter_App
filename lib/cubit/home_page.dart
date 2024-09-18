import 'package:counter_app/cubit/counter_cubit.dart';
import 'package:counter_app/cubit/inc_dec_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
  // without BlocProvider
  // final counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    // while using BlocProvider
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    // final counter below is a one time thing. it displays the initial state of CounterCubit().
    // to which call the setstate() in the onPressed block to re-Render the page. getting one time value from the below line
    // but to avoid setstate() we can use emit() property to notify all the listerner about the update state.
    // final counter = counterCubit.state;
    // Problem with BlocBuilder is if the bloc changes the builder re-render the entire return widget.whenever the state of the counterCubit changes.
    // return BlocBuilder<CounterCubit, int>(
    //     bloc: counterCubit,
    //     builder: (context, counter) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            // Now the implement only modify the Text counter
            BlocBuilder<CounterCubit, int>(
                bloc: counterCubit,
                builder: (context, counter) {
                  return Text(
                    '$counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const IncDecPage(),
                ),
              );
            },
            tooltip: 'Navigate',
            child: const Icon(Icons.navigate_next),
          ),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  counterCubit.increment();
                  // setState(() {
                  //   counterCubit.increment();
                  // });
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 20),
              FloatingActionButton(
                onPressed: () {
                  counterCubit.decrement();
                },
                tooltip: 'Decrement',
                child: const Icon(Icons.minimize),
              ),
            ],
          ),
        ],
      ),
    );
    // });
  }
}
