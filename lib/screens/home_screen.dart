import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:task_elevate/bolc/states.dart';

import '../bolc/cubit.dart' show HomeCubit;

class HomeScreen extends StatelessWidget {
  static const String routName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) {
      BlocConsumer(builder: (context, state) {

      }, listener: (context, state) {

      },)
    },)
  }
}