import 'package:flutter/material.dart';
import 'package:mostbet_3/app/navigator/navigator.dart';
import 'package:mostbet_3/core/data/quiz_data.dart';
import 'package:mostbet_3/core/extensions/padding_extension_on_widget.dart';
import 'package:mostbet_3/gen/assets.gen.dart';

import 'game_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Assets.images.quizBg.image(fit: BoxFit.cover),
        ),
        Positioned.fill(
          child: Column(
            children: [
              const Spacer(
                flex: 3,
              ),
              const Text(
                'An exciting quiz for real football fans. Test yourself how much of a football expert you are.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                ),
              ).paddingSymetric(horizontal: 24),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  AppNavigator.push(context, page: const QuizGamePage(quiz: footballQuiz));
                },
                child: Container(
                  width: double.maxFinite,
                  height: 48,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFB4E01),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'START QUIZ',
                    style: TextStyle(
                      color: Color(0xFFFAFAFA),
                      fontSize: 22,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ).paddingSymetric(horizontal: 18),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
