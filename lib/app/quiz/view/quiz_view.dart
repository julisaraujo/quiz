import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/quiz/controller/quiz_controller.dart';
import 'package:quiz_app/constants/colors/app_colors.dart';
import 'package:quiz_app/models/api/quiz/quiz_model.dart';
import 'package:quiz_app/util/screen_util.dart';

class QuizView extends StatelessWidget {

  final QuizController quizController = Get.put(QuizController(quizModel: Get.arguments));

  QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBlue,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: AppColors.secondaryBlue,
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: ScreenUtil.getScreenWidth(context),
            height: ScreenUtil.getScreenHeight(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: ScreenUtil.getScreenWidth(context) * 0.95,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(4, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: ScreenUtil.getScreenHeight(context) * 0.025,
                      ),
                      SizedBox(
                        height: ScreenUtil.getScreenHeight(context) * 0.025,
                      ),
                      Text(
                        _getTypeLabel(quizController.quizModel.type),
                        style:
                            const TextStyle(fontSize: 20, color: AppColors.secondaryRed, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: ScreenUtil.getScreenHeight(context) * 0.025,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: ScreenUtil.getScreenWidth(context),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.secondaryRed.withOpacity(0.3),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          quizController.quizModel.question,
                          style:
                              const TextStyle(fontSize: 23, color: AppColors.secondaryRed, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil.getScreenHeight(context) * 0.025,
                      ),
                      for (var item in quizController.quizModel.getAlternatives())
                        GestureDetector(
                          child: AlternativeListTile(alternative: item),
                          onTap: () {
                            quizController.createQuizController.answerQuestion(quizController.quizModel, item);
                          },
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
              top: 10,
              left: 10,
              child: Obx(() {
                return Text(
                  "Points: ${quizController.createQuizController.points.value}",
                  style: const TextStyle(fontSize: 23, color: AppColors.secondaryRed, fontWeight: FontWeight.w600),
                );
              }))
        ],
      ),
    );
  }

  String _getTypeLabel(QuizType type) {
    switch (type) {
      case QuizType.multiple:
        return "Multiple Choice";
      case QuizType.boolean:
        return "True or false";
    }
  }
}

class AlternativeListTile extends StatelessWidget {
  final String alternative;

  const AlternativeListTile({super.key, required this.alternative});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.primaryRed,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        alternative,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.white),
      ),
    );
  }
}
