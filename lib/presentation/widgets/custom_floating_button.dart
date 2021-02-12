 
import 'package:blocTest/Logic/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CustomFloatingButton extends StatelessWidget {
  final String text;
  final bool isAdd;
  final Color color;

  const CustomFloatingButton({Key key, this.text, this.isAdd, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      heroTag: text,
      backgroundColor: color,
      child: Icon(isAdd? Icons.add:Icons.remove),
      tooltip: text,
      onPressed: (isAdd)? BlocProvider.of<CounterCubit>(context).increment:
      BlocProvider.of<CounterCubit>(context).decrement
      );
  }
}