// class Question {
//    String questionText='';
//   late bool questionAnswer;

//   Question({
//     required String q,
//     required bool a,
//   }) {
//     questionText = q;
//     questionAnswer = a;
//   }
// }

class Question{
  String questionText;
  bool questionAnswer;

  Question({
    required this.questionText,
    required this.questionAnswer,
  });
}

Question newQuestion = Question(questionText: 'text', questionAnswer: true);

