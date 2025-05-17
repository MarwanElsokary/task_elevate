import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:task_elevate/bolc/states.dart';
import '../models/GetData.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitState());

  Future<void> getData(String id) async {
    emit(HomeGetLoadingState());
    try {
      var url = Uri.https('fakestoreapi.com', '/products', {});
      http.Response response = await http.get(url);
      Map<String, dynamic> jsonFormat = jsonDecode(response.body);
      GetData getData = GetData.fromJson(jsonFormat);
      emit(HomeGetSuccessState(getData));
    } catch (e) {
      emit(HomeGetErrorState("Something went Worng"));
    }
  }
}
