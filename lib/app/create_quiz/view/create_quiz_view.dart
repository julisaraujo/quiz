import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/create_quiz/controller/create_quiz_controller.dart';

class CreateQuizView extends StatelessWidget {
  final CreateQuizController createQuizController = Get.find<CreateQuizController>();

  CreateQuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (createQuizController.isLoading.value) {
        return Scaffold(
          appBar: AppBar(title: const Text('Create Quiz')),
          body: const Center(child: CircularProgressIndicator()),
        );
      }

      if (createQuizController.hasError.value) {
        return Scaffold(
          appBar: AppBar(title: const Text('Create Quiz')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, color: Colors.red, size: 50),
                const SizedBox(height: 20),
                const Text('Failed to load quizzes', style: TextStyle(fontSize: 18)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    createQuizController.getQuizResponse();
                  },
                  child: const Text('Try Again'),
                ),
              ],
            ),
          ),
        );
      }

      if (createQuizController.quizzes.isNotEmpty) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Quizzes loaded successfully!',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                CountdownTimer(),
              ],
            ),
          ),
        );
      }

      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    });
  }
}

class CountdownTimer extends StatelessWidget {

  CountdownTimer({super.key});

  final CreateQuizController createQuizController = Get.find<CreateQuizController>();

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: createQuizController,
      builder: (controller) {
        int countdown = controller.countdown.value;
        if (countdown == 0) {
          controller.executeAfterCountdown();
        }

        return Column(
          children: [
            Text('Questions in: $countdown seconds', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        );
      },
    );
  }
}
