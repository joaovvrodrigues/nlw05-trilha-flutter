import 'package:devquiz/home/home_page.dart';
import 'package:flutter/material.dart';

import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widgets/button_next/button_next_widget.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String titleQuiz;
  final int length;
  final int result;
  const ResultPage(
      {Key? key,
      required this.titleQuiz,
      required this.length,
      required this.result})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 60),
                child: Image.asset(AppImages.trophy),
              ),
              Text(
                'Parabéns!',
                style: AppTextStyles.heading40,
              ),
              SizedBox(height: 16),
              Text.rich(
                TextSpan(
                    text: 'Você concluiu\n',
                    children: [
                      TextSpan(
                          text: '$titleQuiz\n', style: AppTextStyles.bodyBold),
                      TextSpan(text: 'Com $result de $length acertos.')
                    ],
                    style: AppTextStyles.body),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: ButtonNextWidget.purple(
                          label: 'Compartilhar',
                          onTap: () async {
                            await Share.share(
                                'Check my app made in flutter https://matalarica.page.link/download',
                                subject: 'Look what I made!');
                          }),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: ButtonNextWidget.whiteNoBorder(
                          label: 'Voltar ao início',
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                              ModalRoute.withName('/'),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
