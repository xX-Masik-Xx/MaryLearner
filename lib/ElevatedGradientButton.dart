import 'package:flutter/material.dart';

class ElevatedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;
  final double borderRadius;

  const ElevatedGradientButton({
    Key? key,
    required this.child,
    this.gradient = const LinearGradient(
      colors: [Color.fromARGB(255, 98, 0, 234), Color.fromARGB(255, 141, 59, 255)],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter
    ),
    this.width = 50.0,
    this.height = 50.0,
    this.borderRadius = 10,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(borderRadius),
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
              onPressed();
            },
            child: Center(
              child: child,
            )),
      ),
    );
  }
}
