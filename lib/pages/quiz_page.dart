import 'package:flutter/material.dart';
import '../utils/question.dart';
import '../utils/quiz.dart';

class QuiszPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuiszPage> {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Column(
          children: <Widget>[
            new Expanded(
              child: new Material(
                  color: Colors.greenAccent,
                  child: new InkWell(
                    onTap: () => print('True'),
                    child: new Center(
                      child: new Container(
                        child: new Text('True'),
                      ),
                    ),
                  )),
            ),
            new Expanded(
              child: new Material(
                  color: Colors.redAccent,
                  child: new InkWell(
                    onTap: () => print('False'),
                    child: new Center(
                      child: new Container(
                        child: new Text('False'),
                      ),
                    ),
                  )),
            )
          ],
        )
      ],
    );
  }
}
