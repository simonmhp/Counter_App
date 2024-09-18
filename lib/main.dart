import 'package:counter_app/bloc/counter_bloc.dart';
import 'package:counter_app/cubit/counter_cubit.dart';
import 'package:counter_app/bloc/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   //BlocProvider always ensures that it will return some thing related to bloc.
  //   // the case below it returns CounterCubit().
  //   return BlocProvider(
  //     create: (_) => CounterCubit(),
  //     //BlocProvider used below is CounterBloc(). can keep both along with CounterCubit(). or comment any one.
  //     child: BlocProvider(
  //       create: (_) => CounterBloc(),
  //       child: MaterialApp(
  //         title: 'Flutter Demo',
  //         theme: ThemeData(
  //           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //           useMaterial3: true,
  //         ),
  //         home: const MyHomePage(title: 'Flutter Demo Home Page'),
  //       ),
  //     ),
  //   );
  // }

  // the above same code is using BlocProvider in a deep nested format to implement 2 blocs
  // 1. CounterBloc()
  // 2. CounterCubit()
  // to simplify things the below code implements MultiBlocProvider.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterCubit(),
        ),
        BlocProvider(
          create: (_) => CounterBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
