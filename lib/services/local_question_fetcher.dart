import 'package:quiz/models/question.dart';
import 'package:quiz/services/question_fetcher.dart';

// This class is completely decoupled from the state management and the UI.
class LocalQuestionFetcher implements QuestionFetcher {
  int index = -1;
  List<Question> questions = [
    Question('1+1', ["2", "1", "3"], 0, "ask Miss Resende for help"),
    Question('2+2', ["4", "1", "3"], 0, "ask Miss Resende for help"),
    Question('3+3', ["6", "1", "3"], 0, "ask Miss Resende for help"),
    Question('4+4', ["8", "1", "3"], 0, "ask Miss Resende for help"),
    Question('5+5', ["10", "1", "3"], 0, "ask Miss Resende for help"),
  ];
  @override
  Future<Question> fetch() async {
    index++;
    return questions[index % questions.length];
  }
}
