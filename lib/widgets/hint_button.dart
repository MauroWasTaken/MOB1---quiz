import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:quiz/managers/quiz_manager.dart';
import 'package:quiz/managers/question_manager.dart';

class HintButton extends StatelessWidget with GetItMixin {
  HintButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AsyncSnapshot<bool> snapshot =
        watchStream((QuizManager m) => m.stream, false);

    return SingleChildScrollView(
      child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Column(
            children: <Widget>[
              _buildHintButton(context, snapshot),
            ],
          )),
    );
  }

  Widget _buildHintButton(BuildContext context, AsyncSnapshot<bool> snapshot) {
    if (snapshot.hasData) {
      if (snapshot.data == true) {
        return Text(QuestionManager.instance.currentQuestion.hint,
            style: Theme.of(context).textTheme.headlineLarge);
      } else {
        return Container(
          margin: const EdgeInsets.only(top: 8),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                QuizManager.instance.useHint();
              },
              child: const Text("?"),
            ),
          ),
        );
      }
    } else if (snapshot.hasError) {
      return Text(snapshot.error.toString());
    }
    return const CircularProgressIndicator();
  }
}
