import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/services/local_question_fetcher.dart';
import 'package:quiz/services/question_fetcher.dart';

class QuestionManager {
  final QuestionFetcher _provider;
  late final StreamController<Question> _streamController;
  Question currentQuestion = Question.none();

  QuestionManager(this._provider) {
    _streamController = StreamController();
  }

  Stream<Question> get stream => _streamController.stream;

  void next() async {
    Question question = await _provider.fetch();
    currentQuestion = question;
    _streamController.add(question);
  }

  bool guess(String answer) {
    if (currentQuestion.correctAnswer == -1) {
      return false;
    }
    return answer == currentQuestion.answers[currentQuestion.correctAnswer];
  }

  // Register this manager locator
  // (Every manager will have such a method)
  static void register() {
    GetIt.I
        .registerLazySingleton(() => QuestionManager(LocalQuestionFetcher()));
  }

  // Returns the manager instance
  // (Every manager will have such a getter)
  static QuestionManager get instance => GetIt.I.get<QuestionManager>();
}
