import 'package:blocTest/presentation/router/app_router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Logic/counter/counter_cubit.dart';
import 'Logic/internet/internet_cubit.dart';

void main() {
  runApp(MyApp(connectivity: Connectivity(),));
}

class MyApp extends StatelessWidget {

   
  final route = AppRouter();
  final Connectivity connectivity ;

    MyApp({Key key, @required this.connectivity}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    print("this my app ");
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Bloc',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: route.onGeneratedRoute,
      ),
    );
  }
}

// ignore: non_constant_identifier_names
void showSnakBar_(BuildContext context, String text, Color color) {
  Scaffold.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(
      backgroundColor: color,
      duration: Duration(milliseconds: 300),
      content: Text(text),
    )).closed;
}
