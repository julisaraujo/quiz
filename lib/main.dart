import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/api_client/api_client.dart';
import 'package:quiz_app/app/welcome/view/welcome_view.dart';
import 'package:quiz_app/constants/strings/route_references.dart';
import 'package:quiz_app/routes/routes.dart';

import 'app/create_quiz/controller/create_quiz_controller.dart';

Future<void> main() async {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  final CreateQuizController createQuizController = Get.put(CreateQuizController());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: RoutesPage.getPages,
      home: WelcomeView(),
      initialRoute: RouteReferences.welcome,
    );
  }
}

