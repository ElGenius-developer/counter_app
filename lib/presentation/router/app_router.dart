import 'package:blocTest/Logic/counter/counter_cubit.dart';
import 'package:blocTest/presentation/screens/home_screen.dart';
import 'package:blocTest/presentation/screens/second_screen.dart';
import 'package:blocTest/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  CounterCubit _bloc = CounterCubit();

  _blocProvider(Widget screen) {
    return MaterialPageRoute(
        builder: (_) => screen);
  }

  Route onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return _blocProvider(HomeScreen(
          color: Colors.cyan[600],
          text: "Home screen",
        ));

        break;
      case '/secondScreen':
        return _blocProvider(SecondScreen(
          color: Colors.orange[600],
          text: "Second screen",
        ));

        break;
      case '/thirdScreen':
        return _blocProvider(ThirdScreen(
          color: Colors.red[600],
          text: "Third screen",
        ));
        break;
        default : return null;
    }
  }
}
