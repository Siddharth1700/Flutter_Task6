import 'package:flutter/material.dart';

class MyAnimation extends StatefulWidget {
  @override
  _MyAnimationState createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation>
    with SingleTickerProviderStateMixin {
  var myanicon;
  var animation;

  @override
  void initState() {
    super.initState();
    myanicon = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );

    print(myanicon);

    animation = CurvedAnimation(parent: myanicon, curve: Curves.bounceIn)
      ..addListener(() {
        setState(() {
          print(animation.value);
        });
      });

    print(animation);

    myanicon.forward();
    print(myanicon);
  }

  @override
  void dispose() {
    super.dispose();
    myanicon.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var radius = animation.value * 200;
    var r = (1 * animation.value * 10).toInt();
    return Center(
      child: Card(
        elevation: 150 * animation.value,
        shadowColor: Color.fromRGBO(r, 188, 135, 15),
        child: GestureDetector(
          onTap: () {
            myanicon.forward(from: 0.5);
            print("clicked ..");
          },
          child: Container(
            width: 200 * animation.value + 5,
            height: 200 * animation.value + 5,
            decoration: BoxDecoration(
              color: Color.fromRGBO(r, 188, 135, 15),
              borderRadius: BorderRadius.circular(radius),
            ),
            child: Center(
              child: Text(
                'Animation',
                style: TextStyle(
                  fontSize: 24.0 * animation.value + 8.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
