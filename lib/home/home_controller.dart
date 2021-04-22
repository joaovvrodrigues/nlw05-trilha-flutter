import 'package:devquiz/home/home_repository.dart';
import 'package:devquiz/home/home_state.dart';
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

  final repository = HomeRepository();

  Future<void> getUser() async {
    state = HomeState.loading;
    //await Future.delayed(Duration(seconds: 2));
    user = await repository.getUser();
    state = HomeState.success;
  }

  Future<void> getQuizzes() async {
    state = HomeState.loading;
    //await Future.delayed(Duration(seconds: 2));
    quizzes = await repository.getQuizzes();
    state = HomeState.success;
  }
}
