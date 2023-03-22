class Question {
  String question;
  String hint;
  List<String> answers;
  int correctAnswer;

  Question(this.question, this.answers, this.correctAnswer, this.hint);
  factory Question.none() => Question("", [], -1, "");
}
