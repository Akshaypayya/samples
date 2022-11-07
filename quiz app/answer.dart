import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer(Function() param0, String string, {Key? key, required this.answerText, required this.selectHandler}) : super(key: key);

  final String answerText;
  final VoidCallback selectHandler;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child:ElevatedButton(
        onPressed: selectHandler,
        child: Text(answerText),
      )
    );
  }
}
