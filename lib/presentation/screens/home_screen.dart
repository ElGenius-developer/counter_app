import 'package:blocTest/Logic/counter/counter_cubit.dart';
import 'package:blocTest/Logic/internet/internet_cubit.dart';
import 'package:blocTest/presentation/widgets/custom_floating_button.dart';
import 'package:blocTest/presentation/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocTest/data/constants/enums';
import '../../main.dart';

class HomeScreen extends StatelessWidget {
  final String text;
  final Color color;

  const HomeScreen({Key key, this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        final _scaffoldKey = GlobalKey<ScaffoldState>();

    print("this CounterScreen ");
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.Wifi) {
          BlocProvider.of<CounterCubit>(context).increment();
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.Mobile) {
          BlocProvider.of<CounterCubit>(context).decrement();
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
          appBar: AppBar(
            title: Text(text),
            backgroundColor: color,
          ),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<InternetCubit, InternetState>(
                  builder: (_, state) {
                    if (state is InternetConnected &&
                        state.connectionType == ConnectionType.Wifi) {
                      return CustomTextMessage(
                          connectionType: state.connectionType);
                    } else if (state is InternetConnected &&
                        state.connectionType == ConnectionType.Mobile) {
                      return CustomTextMessage(
                          connectionType: state.connectionType);
                    } else if (state is InternetDisconnected) {
                      return CustomTextMessage();
                    }
                    return CircularProgressIndicator();
                  },
                ),
                Divider(
                  height: 5,
                ),
                Text(
                  "The counter number is :",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: color),
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomFloatingButton(
                        text: "minus",
                        isAdd: false,
                        color: color,
                      ),
                      BlocConsumer<CounterCubit, CounterState>(
                          listener: (context, state) => (state.isAdd)
                              ? showSnakBar_(context, "increment", color)
                              : showSnakBar_(context, "decrement", color),
                          builder: (_, state) => Text(
                                "${state.counter}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    .copyWith(color: color),
                              )),
                      CustomFloatingButton(
                        text: "add",
                        isAdd: true,
                        color: color,
                      ),
                    ],
                  ),
                ),
                CupertinoButton(
                    child: Text("Second Screen"),
                    color: color,
                    onPressed: () {
                      Navigator.pushNamed(context, '/secondScreen').then((_){
                        _scaffoldKey.currentState.removeCurrentSnackBar();
                      } );
                    })
              ],
            ),
          )),
    );
  }
}
