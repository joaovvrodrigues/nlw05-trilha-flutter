import 'package:flutter/material.dart';

import 'package:devquiz/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:devquiz/shared/models/question_model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onChange;
  const QuizWidget({
    Key? key,
    required this.question,
    required this.onChange,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int? indexSelected;

  AnswerModel answer(int index) => widget.question.answers[index];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 64),
          Text(widget.question.title, style: AppTextStyles.heading),
          SizedBox(height: 24),
          for (var i = 0; i < widget.question.answers.length; i++)
            AnswerWidget(
              disabled: indexSelected != null,
              answer: answer(i),
              isSelected: indexSelected == i,
              onTap: () {
                indexSelected = i;

                Future.delayed(Duration(milliseconds: 750))
                    .then((value) => widget.onChange());

                setState(() {});
              },
            )

          // ...widget.question.answers
          //     .map((e) => AnswerWidget(isRight: e.isRight, title: e.title))
          //     .toList()
        ],
      ),
    );
  }
}
