import 'dart:async';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:quiz_app/api_client/api_client.dart';
import 'package:quiz_app/constants/strings/route_references.dart';

import '../../../models/api/quiz/quiz_model.dart';

class WelcomeController extends GetxController {

  RxBool isVisible = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    startFlashing();
  }

  void startFlashing() {
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      isVisible.value = !isVisible.value;
    });
  }

  tapScreen() {
    Get.offAllNamed(RouteReferences.createQuiz);
  }
}
