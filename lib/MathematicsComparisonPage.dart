import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import 'EquationCardList.dart';

class MathematicsComparisonPage extends StatefulWidget with ChangeNotifier{
  MathematicsComparisonPage({Key? key, required this.title}) : super(key: key);
  late int solvedEquations = 0;
  late int requiredEquationsAmount = 15;
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MathematicsComparisonPage> createState() => _MathematicsComparisonPageState();
}

class _MathematicsComparisonPageState extends State<MathematicsComparisonPage> with ChangeNotifier {

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final EquationCardComparisonList _equationCardsComparisonList = EquationCardComparisonList(
      onCorrectAnswer: () {},
      amountOfCards: 4,
    );
    _equationCardsComparisonList.onCorrectAnswer = () {
      log("called");
      setState(() {
        widget.solvedEquations += 1;
        log(widget.solvedEquations.toString());
      });
      if(widget.solvedEquations == 4 || widget.solvedEquations == 8 || widget.solvedEquations == 12) {
        log("if called");
        _equationCardsComparisonList.removeCard2();
      }
    };

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text(
            'Математика',
            style: TextStyle(
                color: Colors.white,
                fontSize: screenHeight * 0.05,
                fontWeight: FontWeight.w900,
                fontFamily: 'Nunito-Black'
            ),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 98, 0, 234),
                    Color.fromARGB(255, 141, 59, 255)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter
              ),
            ),
          ),
        ),

        body: Stack(
            children: [
              _equationCardsComparisonList,
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 15.0),
                      child: CircularPercentIndicator(
                          radius: screenHeight * 0.125,
                          lineWidth: screenHeight * 0.015625,
                          percent: widget.solvedEquations / widget.requiredEquationsAmount,
                          progressColor: Colors.yellow[600],
                          backgroundColor: Colors.grey.shade100,
                          circularStrokeCap: CircularStrokeCap.round,
                          animation: true,
                          animationDuration: 1000,
                          curve: Curves.bounceOut,

                          center: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [Colors.red, Colors.orange],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Container(
                                width: screenHeight * 0.20,
                                height: screenHeight * 0.20,
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                        colors: [Color.fromARGB(
                                            255, 98, 0, 234), Color.fromARGB(
                                            255, 141, 59, 255)
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        screenHeight * 0.4),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0.0, 1.5),
                                        blurRadius: 1.5,
                                      ),
                                    ]),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                      onTap: () {
                                        if(widget.solvedEquations == widget.requiredEquationsAmount) {
                                          Navigator.pop(context);
                                        }
                                        else if((widget.solvedEquations == 4 || widget.solvedEquations == 8 || widget.solvedEquations == 12)) {
                                          _equationCardsComparisonList.removeCard2();
                                          log(_equationCardsComparisonList.usedCards.toString());
                                        }
                                      },
                                      child: Center(
                                        child: Text(
                                          '⭐',
                                          style: TextStyle(
                                              color: const Color(0xFFFDD835),
                                              fontSize: screenHeight * 0.115,
                                              fontFamily: 'SegoeUI'
                                          ),
                                        ),
                                      )
                                  ),
                                ),
                              )
                          )

                      )
                  )
              ),
            ]
        )
    );
  }
}