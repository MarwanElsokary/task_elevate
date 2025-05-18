import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_elevate/bolc/cubit.dart';
import 'package:task_elevate/bolc/states.dart';

import '../widget/card_item.dart';

class HomeScreen extends StatelessWidget {
  static const routName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getData(),
      child: Scaffold(
        backgroundColor: Colors.white,

        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeGetLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeGetErrorState) {
              return Center(child: Text(state.error));
            } else if (state is HomeGetSuccessState) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    return CardItem(item: state.products[index]);
                  },
                ),
              );
            } else {
              return const Center(child: Text('Press button to load products'));
            }
          },
        ),
      ),
    );
  }
}
