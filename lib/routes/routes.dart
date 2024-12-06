import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:quiz_app/app/create_quiz/view/create_quiz_view.dart';
import 'package:quiz_app/app/quiz/view/quiz_view.dart';
import 'package:quiz_app/app/welcome/view/welcome_view.dart';

import '../constants/strings/route_references.dart';

class RoutesPage {
  static List<GetPage<dynamic>> getPages = [
    GetPage(name: RouteReferences.welcome, page: () => WelcomeView()),
    GetPage(name: RouteReferences.createQuiz, page: () => CreateQuizView()),
    GetPage(name: RouteReferences.quiz, page: () => QuizView()),
  ];
}