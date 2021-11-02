import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/modules/counter/cubit/counter_cubit.dart';
import 'package:new_project/modules/counter/cubit/counter_states.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
        listener: (BuildContext context, state) {
          if(state is CounterPlusState)
          {
            print("Plus State ${state.counter}");
          }
          if(state is CounterMinusState){
            print("Minus State ${state.counter}");
          }
        },
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(title: Text("Counter")),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                        CounterCubit.get(context).minus();
                    },
                    child: Text("MINUS"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "${CounterCubit.get(context).counter}",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                        CounterCubit.get(context).plus();
                    },
                    child: Text("PLUS"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
