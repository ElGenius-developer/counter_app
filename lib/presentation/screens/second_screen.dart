import 'package:blocTest/Logic/counter/counter_cubit.dart';
import 'package:blocTest/Logic/internet/internet_cubit.dart';
import 'package:blocTest/presentation/widgets/custom_floating_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';

class SecondScreen extends StatelessWidget {
  final String text;
  final Color color;

  const SecondScreen({Key key, this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    print("this CounterScreen ");
    return Scaffold(
      key: _scaffoldKey,
        appBar: AppBar(
          title: Text(text),
          backgroundColor: color,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                            ? showSnakBar_(context, "increment",color)
                            : showSnakBar_(context, "decrement",color),
                        builder: (_, state) {
                          final insta = BlocProvider.of<InternetCubit>(context);
                          print(insta.state);
                          return Text(
                              "${state.counter}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(color: color),
                            );
                        }),
                    CustomFloatingButton(
                      
                      text: "add",
                      isAdd: true,
                      color: color,
                    ),
                  ],
                ),
              ),
                CupertinoButton(
                  child: Text("Third Screen"),
                  color: color,
                  onPressed: () {
                    Navigator.pushNamed(context, '/thirdScreen');
                    
                  })
            ],
          ),
        ));
  }
}

 