import 'dart:developer';

import 'package:flutter/cupertino.dart';

import 'EquationCardComparison.dart';

class EquationCardComparisonList extends StatefulWidget with ChangeNotifier {
  late Function onCorrectAnswer;
  final int amountOfCards;
  late GlobalKey<AnimatedListState> _stateListKey = _stateListKey;
  late final List<EquationCardComparison> _equationCardsList;
  int usedCards = 0;


  EquationCardComparisonList({
    Key? key,
    required this.onCorrectAnswer,
    this.amountOfCards = 15
  }) : super(key: key);

  @override
  _EquationCardComparisonListState createState() => _EquationCardComparisonListState();

  //GlobalKey<AnimatedListState> getListKey() => _stateListKey;

  //void getEquationCardsList() => _equationCardsList;
  void removeCard2() {
    removeCard(_stateListKey, _equationCardsList);
    notifyListeners();
  }

  void removeCard(GlobalKey<AnimatedListState> _listKey, List<EquationCardComparison> equationCardsList) {
    log("removed");
    for(var i = 0; i < 4; i++) {
      equationCardsList.removeAt(0);
      _listKey.currentState?.removeItem(
          equationCardsList.length, (contex,
          animation) => equationCardsList[equationCardsList.length]);
    }
    for(var i = 0; i < 4 && usedCards + i - 1< amountOfCards; i++) {
       equationCardsList.add(EquationCardComparison(onCorrectAnswer: onCorrectAnswer,));
       _listKey.currentState?.insertItem(equationCardsList.length - 1);
    }
    usedCards += 1;

  }
}

class _EquationCardComparisonListState extends State<EquationCardComparisonList> {
  static final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  static List<EquationCardComparison> equationCardsList = [];
  final Tween<Offset> _offset = Tween(begin: const Offset(1,0), end: const Offset(0,0));

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      addCards();
    });
  }

  void addCards() {
    List<EquationCardComparison> _equationCardsList = List.filled(4, EquationCardComparison(onCorrectAnswer: widget.onCorrectAnswer,));

    Future future = Future(() {});
    for (var card in _equationCardsList) {
      future = future.then((_) {
        return Future.delayed(const Duration(milliseconds: 100), () {
          equationCardsList.add(card);
          _listKey.currentState?.insertItem(equationCardsList.length - 1);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    widget._stateListKey = _listKey;
    widget._equationCardsList = equationCardsList;
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.1125 * 5,
      child: AnimatedList(
          key: _listKey,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index, animation) {
            return SlideTransition(
              child: equationCardsList[index],
              position: animation.drive(_offset),
            );
          }
      ),
    );
  }
}
