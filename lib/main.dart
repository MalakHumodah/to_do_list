import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/features/home/presentation/bloc/home_bloc.dart';

import 'Services/shared_pref.dart';
import 'features/home/presentation/views/home_page.dart';



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (BuildContext context) => HomeBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To Do List',
        home: HomePage(),
      ),
    );
  }
}

