import 'package:devquiz/challenge/challenge_controller.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/result/result_page.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:devquiz/shared/widgets/button_next/button_next_widget.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String titleQuiz;

  const ChallengePage(
      {Key? key, required this.questions, required this.titleQuiz})
      : super(key: key);
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length) {
      pageController.nextPage(
          duration: Duration(milliseconds: 400), curve: Curves.decelerate);
    }
  }

  void onSelected(bool value) {
    if (value) {
      controller.qtdAnswerRight++;
    }
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: BackButton(),
              ),
              ValueListenableBuilder<int>(
                  valueListenable: controller.currentPageNotifier,
                  builder: (context, value, _) {
                    return QuestionIndicatorWidget(
                      currentPage: value,
                      length: widget.questions.length,
                    );
                  })
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map((e) => QuizWidget(
                  question: e,
                  onSelected: onSelected,
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ValueListenableBuilder<int>(
            valueListenable: controller.currentPageNotifier,
            builder: (context, value, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (value < widget.questions.length)
                    Expanded(
                        child: ButtonNextWidget.white(
                      label: 'Pular',
                      onTap: () {
                        nextPage();
                      },
                    )),
                  if (value == widget.questions.length)
                    Expanded(
                        child: ButtonNextWidget.green(
                            label: 'Confirmar',
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultPage(
                                          result: controller.qtdAnswerRight,
                                            length: widget.questions.length,
                                            titleQuiz: widget.titleQuiz,
                                          )));
                            }))
                  // value != widget.questions.length
                  //     ? Expanded(
                  //         child: ButtonNextWidget.disabled(label: 'Confirmar'))
                  //     : Expanded(
                  //         child: ButtonNextWidget.green(
                  //             label: 'Confirmar',
                  //             onTap: () {
                  //               Navigator.pop(context);
                  //             }))
                ],
              );
            }),
      )),
    );
  }
}
