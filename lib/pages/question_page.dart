import 'package:flutter/material.dart';
import 'package:quiz/pages/template.dart';
import 'package:quiz/widgets/question_view.dart';

class QuestionPage extends Template {
  @override
  Widget build(BuildContext newContext) {
    context = newContext;
    return Scaffold(
        appBar: header("Question"),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: QuestionView(),
        ),
        bottomNavigationBar: bottom());
  }
}
