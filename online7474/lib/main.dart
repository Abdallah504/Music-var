import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online7474/Screens/counter-screen.dart';
import 'package:online7474/Screens/new-screen.dart';
import 'package:online7474/logic/counting_cubit.dart';
import 'package:online7474/logic/data/dio-helper.dart';
import 'package:online7474/logic/main-app-provider.dart';
import 'package:online7474/logic/news/news_cubit.dart';
import 'package:provider/provider.dart';

import 'Screens/bbc-screen.dart';

void main() {
  runApp(const MyApp());
}

// News App => News BBC => News api

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  var dioHelper  = DioImplementation();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=> CountingCubit()),
      BlocProvider(create: (context)=> NewsCubit(dioHelper)..NewsData())
    ],
    child:  MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: News(),
    ),
    );
  }
}

