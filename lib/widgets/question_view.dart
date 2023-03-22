import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:quiz/managers/question_manager.dart';
import 'package:quiz/managers/quiz_manager.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/widgets/hint_button.dart';

class QuestionView extends StatelessWidget with GetItMixin {
  QuestionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AsyncSnapshot<Question> snapshot =
        watchStream((QuestionManager m) => m.stream, Question.none());

    return SingleChildScrollView(
      child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Column(
            children: <Widget>[
              _buildQuote(context, snapshot),
            ],
          )),
    );
  }

  Widget _buildQuote(BuildContext context, AsyncSnapshot<Question> snapshot) {
    if (snapshot.hasData) {
      if (QuizManager.instance.totalQuestions >=
          QuizManager.instance.currentQuestion) {
        return Column(
          children: [
            Text(
                'Question ${QuizManager.instance.currentQuestion} of ${QuizManager.instance.totalQuestions}'),
            HintButton(),
            Text(snapshot.data!.question,
                style: Theme.of(context).textTheme.headlineLarge),
            ...snapshot.data!.answers.map(
              (answer) => Container(
                margin: const EdgeInsets.only(top: 8),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      QuizManager.instance.checkAnswer(answer);
                    },
                    child: Text(answer),
                  ),
                ),
              ),
            ),
          ],
        );
      } else {
        return Center(
            child: Column(
          children: [
            Text(
                'You got a Score of ${QuizManager.instance.score} out of ${QuizManager.instance.totalQuestions}',
                style: Theme.of(context).textTheme.headlineLarge),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    QuizManager.instance.startQuiz();
                  },
                  child: Text("Restart Quiz"),
                ),
              ),
            ),
          ],
        ));
      }
    } else if (snapshot.hasError) {
      return Text(snapshot.error.toString());
    }
    return const CircularProgressIndicator();
  }
}
