import 'package:flutter/material.dart';
import '../utils/question.dart';
import '../utils/quiz.dart';

import '../ui/answer_button.dart';
import '../ui/question_text.dart';
import '../ui/correct_wrong_overlay.dart';

class QuiszPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuiszPage> {
  bool isCorrect;
  int questionNumber;
  String questionText;
  Question currentQuestion;
  bool overlayShouldVisible = false;
  Quiz quiz = new Quiz([
    new Question("true 1", true),
    new Question("true 2", true),
    new Question("true 3", true),
    new Question("false 1", false)
  ]);

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
       overlayShouldVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)),
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => handleAnswer(false))
          ],
        ),
        overlayShouldVisible
            ? new CorrectWrongOverlay(isCorrect, () {
                currentQuestion = quiz.nextQuestion;
                this.setState(() {
                  overlayShouldVisible = false;
                  questionText = currentQuestion.question;
                  questionNumber = quiz.questionNumber;
                });
              })
            : new Container()
      ],
    );
  }
}
