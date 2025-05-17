import 'package:task_elevate/models/GetData.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeGetLoadingState extends HomeState {}

class HomeGetSuccessState extends HomeState {
  GetData getData;

  HomeGetSuccessState(this.getData);
}

class HomeGetErrorState extends HomeState {
  String error = "Something went Worng";

  HomeGetErrorState(this.error);
}
