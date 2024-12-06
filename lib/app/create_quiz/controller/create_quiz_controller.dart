import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/quiz/view/quiz_view.dart';
import 'package:quiz_app/constants/strings/route_references.dart';
import '../../../api_client/api_client.dart';
import '../../../models/api/quiz/quiz_model.dart';

class CreateQuizController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool hasError = false.obs;
  List<QuizModel> quizzes = [];

  RxInt countdown = 5.obs;

  RxInt points = 0.obs;
  int currentQuiz = 0;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getQuizResponse();
  }

  Future<void> getQuizResponse() async {
    final dio = Dio();
    final quizService = ApiClient(dio);

    try {
      isLoading.value = true;
      hasError.value = false;
      final response = await quizService.getQuizzes(50);
      quizzes.assignAll(response.results);
      startCountdown();
    } catch (e) {
      print("Error: $e");
      hasError.value = true;
      Get.snackbar(
        'Error',
        'Failed to load quizzes',
      );
    } finally {
      isLoading.value = false;
    }
  }

  void startCountdown() {
    Future.delayed(const Duration(seconds: 1), () {
      if (countdown.value > 0) {
        countdown.value--;
        startCountdown();
      }
    });
  }


  void executeAfterCountdown() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.offAllNamed(RouteReferences.quiz, arguments: quizzes[currentQuiz]);
    });
  }

  answerQuestion(QuizModel quizModel, String answer) {
    if (answer == quizModel.correctAnswer) {
      points.value = points.value + quizzes[currentQuiz].getPoints();
      if (currentQuiz + 1 < quizzes.length) {
        currentQuiz = currentQuiz + 1;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.offAllNamed(RouteReferences.quiz, arguments: quizzes[currentQuiz]);
        });
      } else {
        _showSuccessDialog();
      }
    } else {
      _showErrorDialog();
    }
  }

  _showErrorDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('You got it wrong!'),
        content: Text('Your total points: ${points.value}'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Fecha o diálogo
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  _showSuccessDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Congratulations!'),
        content: Text(
            'You got all the questions right!\nYour total points: ${points.value}'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
