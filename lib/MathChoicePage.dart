import 'package:flutter/material.dart';
import 'package:mary_learner_flutter/MathematicsComparisonPage.dart';

import 'ElevatedGradientButton.dart';
import 'MathematicsPage.dart';

class MathChoicePage extends StatelessWidget {
  const MathChoicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Математика:',
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
                colors: [Color.fromARGB(255, 98, 0, 234), Color.fromARGB(255, 141, 59, 255)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter
            ),
          ),
        ),
      ),
      body: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedGradientButton(
                  width: screenHeight * 0.27,
                  height: screenHeight * 0.27,
                  borderRadius: 25,
                  onPressed: () {
                    // Pushing a route directly, WITHOUT using a named route
                    Navigator.pushNamed(context, '/math');
                  },
                  child: const Text(
                    '+/-',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 100,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Nunito-Black'
                    ),
                  ),
                ),
                ElevatedGradientButton(
                  width: screenHeight * 0.27,
                  height: screenHeight * 0.27,
                  borderRadius: 25,
                  onPressed: () {
                    // Pushing a route directly, WITHOUT using a named route
                    Navigator.pushNamed(context, '/mathComparison');
                  },
                  child: const Text(
                    'Сравнение',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Nunito-Black'
                    ),
                  ),
                ),
              ]
          )
      ),
    );
  }
}
