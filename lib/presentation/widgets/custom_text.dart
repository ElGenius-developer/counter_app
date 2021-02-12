import 'package:blocTest/Logic/internet/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocTest/data/constants/enums';

// ignore: must_be_immutable
class CustomTextMessage extends StatelessWidget {
  final connectionType;

  const CustomTextMessage({Key key, this.connectionType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final internetState = BlocProvider.of<InternetCubit>(context).state;

    return Text(
      (internetState is InternetDisconnected)
                ? "Dissconnected"
                : (connectionType == ConnectionType.Wifi)
                    ? "Wifi"
                    : "Mobile",
      style: Theme.of(context).textTheme.headline3.copyWith(
            color: (internetState is InternetDisconnected)
                ? Colors.grey
                : (connectionType == ConnectionType.Wifi)
                    ? Colors.green
                    : Colors.red,
          ),
    );
  }
}
