import 'package:devquiz/home/home_repository.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

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

  final repository = HomeRepository();

  Future<void> fetchData() async {
    state = HomeState.loading;
    user = await repository.getUser();
    quizzes = await repository.getQuizzes();
    state = HomeState.success;
  }
}
