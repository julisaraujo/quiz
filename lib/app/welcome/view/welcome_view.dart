import 'package:flutter/material.dart';
import 'package:quiz_app/app/welcome/controller/welcome_controller.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants/colors/app_colors.dart';
import 'package:quiz_app/constants/images/images.dart';
import 'package:quiz_app/util/screen_util.dart';

class WelcomeView extends StatelessWidget {
  final WelcomeController welcomeController = Get.put(WelcomeController());

  WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryRed,
      body: GestureDetector(
        onTap: welcomeController.tapScreen,
        child: Container(
          color: Colors.transparent,
          width: ScreenUtil.getScreenWidth(context),
          height: ScreenUtil.getScreenHeight(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.quizLogo,
                width: ScreenUtil.getScreenWidth(context) * 0.75,
                fit: BoxFit.fitWidth,
              ),
              Obx(() {
                return Text(
                  welcomeController.isVisible.value ? 'Tap to continue' : "",
                  style: TextStyle(
                    fontSize: 40,
                    color: AppColors.secondaryBlue,
                    shadows: <Shadow>[
                      Shadow(
                        offset: const Offset(0.0, 2.0),
                        blurRadius: 3.0,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ],
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
