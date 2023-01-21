import 'dart:math';

import 'package:flutter/material.dart';


class EquationCardComparison extends StatefulWidget {
  final Function onCorrectAnswer;

  const EquationCardComparison({
    Key? key,
    required this.onCorrectAnswer,
  }) : super(key: key);

  @override
  State<EquationCardComparison> createState() => _EquationCardComparisonState();
}

class _EquationCardComparisonState extends State<EquationCardComparison> {
  final _textController = TextEditingController();
  late List<int> equation = generateEquation();
  late int correctAnswer = equationAnswer();
  bool isReadOnly = false;
  int isAnswerCorrect = 0;
  late String currentChosenAnswer = '∧';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
        width: screenWidth * 0.8,
        height: screenHeight * 0.1125,
        margin: EdgeInsets.symmetric(vertical: screenHeight * 0.014, horizontal: screenWidth * 0.045),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(screenHeight * 0.01525),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(screenHeight * 0.00457, screenHeight * 0.00457),
                  blurRadius: screenHeight * 0.014,
                  spreadRadius: screenHeight * 0.0007
              ),
            ]
        ),
        child: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text(
                  equation.first.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: screenHeight * 0.05,
                      fontFamily: 'RubikMonoOne'
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: DropdownButton(
                    value: currentChosenAnswer,
                    items: const [
                      DropdownMenuItem(value: '∧' ,child: Text('∧')),
                      DropdownMenuItem(value: '<' ,child: Text('<')),
                      DropdownMenuItem(value: '>' ,child: Text('>')),
                      DropdownMenuItem(value: '=' ,child: Text('=')),
                    ],
                    onChanged: (String? value) => setState(() => currentChosenAnswer = value!),
                  ),
                ),
                Text(
                  equation.last.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: screenHeight * 0.05,
                      fontFamily: 'RubikMonoOne'
                  ),
                ),
                // DropdownButton<String>(
                //   items: const [
                //     DropdownMenuItem(child: Text('<')),
                //     DropdownMenuItem(child: Text('>')),
                //     DropdownMenuItem(child: Text('=')),
                //   ],
                //   style: TextStyle(
                //       color: isAnswerCorrect == 0 ? Colors.deepPurpleAccent[700] : isAnswerCorrect == 1 ? const Color.fromRGBO(35, 176, 54, 1): const Color.fromRGBO(236, 91, 95, 1),
                //       fontSize: screenHeight * 0.065,
                //       fontWeight: FontWeight.w900,
                //       fontFamily: 'Nunito-Black'
                //   ),
                //   onChanged: (value) { setState(() {
                //     isReadOnly = true;
                //     if(correctAnswer == int.parse(_textController.text)) {
                //       setState(() {
                //         isAnswerCorrect = 1;
                //       });
                //       widget.onCorrectAnswer();
                //     }
                //     else {
                //       isAnswerCorrect = -1;
                //       Timer(const Duration(seconds: 2), () {
                //         setState(() { isReadOnly = false; });
                //       });
                //     }
                //   }); },
                // ),
              ]
          ),
        )
    );
  }

  List<int> generateEquation() {
    Random random = Random();
    int firstNumber = random.nextInt(101);
    int secondNumber = random.nextInt(101);
    return <int>[firstNumber,secondNumber];
  }

  int equationAnswer() {
    return equation.first < equation.last ? -1 : equation.first > equation.last ? 1 : 0;
  }
}