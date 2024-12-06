import 'package:get/get.dart';
import 'package:quiz_app/app/create_quiz/controller/create_quiz_controller.dart';
import '../../../models/api/quiz/quiz_model.dart';

class QuizController extends GetxController {
  final QuizModel quizModel;

  QuizController({required this.quizModel});

  final CreateQuizController createQuizController = Get.find<CreateQuizController>();

}