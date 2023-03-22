import 'package:flutter/material.dart';
import 'package:quiz/pages/question_page.dart';
import 'package:quiz/managers/question_manager.dart';
import 'package:quiz/managers/quiz_manager.dart';

void main() {
  // Register all managers
  QuestionManager.register();
  QuizManager.register();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: QuestionPage(),
    );
  }
}
