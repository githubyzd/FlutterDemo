import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  static final String sName = "/";

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  TimerUtil timerUtil;

  @override
  void initState() {
    timerUtil = new TimerUtil(mInterval: 1000);
    timerUtil.setOnTimerTickCallback((int value) {
      if (value == 0) {}

      LogUtil.e("TimerTick: " + value.toString());
    });
    timerUtil.startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Image(
        image: new AssetImage('assets/images/welcome.png'),
        fit: BoxFit.cover,
      ),
    );
  }
}
