import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online7474/logic/counting_cubit.dart';
import 'package:online7474/logic/main-app-provider.dart';
import 'package:provider/provider.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    final counting = context.read<CountingCubit>();
    return BlocConsumer<CountingCubit,CountingState>(builder: (context ,state){
      return Scaffold(
        appBar: AppBar(
          title: Text('Counting'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(counting.xyz.toString()),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    counting.increment();
                  }, child: Icon(Icons.add)),
                  SizedBox(width: 10,),
                  ElevatedButton(onPressed: (){
                    counting.decrement();
                  }, child: Text('-'))
                ],
              )
            ],
          ),
        ),
      );
    }, listener: (context ,state){});
  }
}
