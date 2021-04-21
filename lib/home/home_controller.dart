import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

String photoEmicida =
    'https://yt3.ggpht.com/ytc/AAUvwniYRFlqcpN8Q3r0Oc0BaNzJsqmY0Lt01ucferpVmA=s900-c-k-c0x00ffffff-no-rj';

class HomeController {
  // Classes que precisam ser gerenciadas por esse controller:
  // USER
  // QUIZZES

  final ValueNotifier<HomeState> stateNotifier =
      ValueNotifier<HomeState>(HomeState.empty);

  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  Future<void> getUser() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));

    user = UserModel(name: 'Emicida', photoUrl: photoEmicida);
    state = HomeState.success;
  }

  Future<void> getQuizzes() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    quizzes = [
      QuizModel(
          title: 'NLW 5 Flutter',
          questionAnswered: 1,
          questions: [
            QuestionModel(title: 'Está curtindo o Flutter ?', answers: [
              AnswerModel(title: 'Sim!'),
              AnswerModel(title: 'Não!'),
              AnswerModel(title: 'Muito!'),
              AnswerModel(title: 'Catapimbas estoy amando!', isRight: true),
            ]),
            QuestionModel(title: 'Está curtindo o Flutter ?', answers: [
              AnswerModel(title: 'Sim!'),
              AnswerModel(title: 'Não!'),
              AnswerModel(title: 'Muito!'),
              AnswerModel(title: 'Catapimbas estoy amando!', isRight: true),
            ]),
            QuestionModel(title: 'Está curtindo o Flutter ?', answers: [
              AnswerModel(title: 'Sim!'),
              AnswerModel(title: 'Não!'),
              AnswerModel(title: 'Muito!'),
              AnswerModel(title: 'Catapimbas estoy amando!', isRight: true),
            ])
          ],
          image: AppImages.blocks,
          level: Level.facil)
    ];
    state = HomeState.success;
  }
}
