import 'package:flutter/material.dart';

import 'package:devquiz/core/core.dart';
import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String image;
  final int questionAnswered;
  final int total;
  final VoidCallback onTap;
  const QuizCardWidget({
    Key? key,
    required this.title,
    required this.image,
    required this.questionAnswered,
    required this.total,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.fromBorderSide(
            BorderSide(color: AppColors.border),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset(AppImages.blocks),
            ),
            SizedBox(height: 24),
            Text(title, style: AppTextStyles.heading15),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text('$questionAnswered de $total',
                      style: AppTextStyles.body11),
                ),
                Expanded(
                    flex: 3,
                    child: ProgressIndicatorWidget(
                        value: questionAnswered / total)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
