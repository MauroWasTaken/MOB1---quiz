import 'package:quiz/models/question.dart';

abstract class QuestionFetcher {
  Future<Question> fetch();
}
