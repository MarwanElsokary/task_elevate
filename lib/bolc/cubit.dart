import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:task_elevate/bolc/states.dart';
import '../models/GetData.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitState());

  Future<void> getData() async {
    emit(HomeGetLoadingState());
    try {
      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products'),
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        List<GetData> products =
            jsonList.map((json) => GetData.fromJson(json)).toList();
        emit(HomeGetSuccessState(products));
      } else {
        emit(
          HomeGetErrorState("Failed to load products: ${response.statusCode}"),
        );
      }
    } catch (e) {
      emit(HomeGetErrorState("Error: ${e.toString()}"));
    }
  }
}
