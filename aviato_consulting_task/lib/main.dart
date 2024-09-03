import 'package:aviato_consulting_task/features/home/view/home_view.dart';
import 'package:aviato_consulting_task/utils/logic/di/di.dart';
import 'package:aviato_consulting_task/utils/ui/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: DI(),
      defaultTransition: Transition.fadeIn,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      scrollBehavior: const ScrollBehavior()
          .copyWith(physics: const BouncingScrollPhysics()),
      home: HomeView(),
    );
  }
}
