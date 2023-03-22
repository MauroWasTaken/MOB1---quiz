import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:quiz/managers/question_manager.dart';

class QuizManager {
  final int totalQuestions;
  late int currentQuestion;
  late int score;
  late bool usedHint = false;
  late final StreamController<bool> _streamController;

  QuizManager(this.totalQuestions) {
    _streamController = StreamController.broadcast();
    _streamController.add(false);
    startQuiz();
  }

  Stream<bool> get stream => _streamController.stream;

  void checkAnswer(String answer) {
    if (QuestionManager.instance.guess(answer)) {
      if (!usedHint) score++;
    }
    if (totalQuestions >= currentQuestion) {
      currentQuestion++;
    }
    usedHint = false;
    _streamController.add(usedHint);
    QuestionManager.instance.next();
  }

  void startQuiz() {
    score = 0;
    currentQuestion = 1;
    QuestionManager.instance.next();
  }

  void useHint() {
    usedHint = true;
    _streamController.add(usedHint);
  }

  static void register() {
    GetIt.I.registerLazySingleton(() => QuizManager(10));
  }

  static QuizManager get instance => GetIt.I.get<QuizManager>();
}
