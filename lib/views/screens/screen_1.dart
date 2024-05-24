import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> with WidgetsBindingObserver {
  AppLifecycleState? appLifecycleState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    setState(() {
      appLifecycleState = state;
    });
    print(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('APPBAR'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Expanded(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX:
                    appLifecycleState == AppLifecycleState.inactive ? 10 : 0,
                sigmaY:
                    appLifecycleState == AppLifecycleState.inactive ? 10 : 0,
              ),
              child: Center(
                child: appLifecycleState == AppLifecycleState.inactive
                    ? Image.asset(
                        'assets/images/image.png',
                        width: 200,
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
