import 'package:flutter/material.dart';
import 'dart:async';

class ComputationScreen extends StatelessWidget {
  Future<int> heavyComputation() async {
    return await Future.delayed(const Duration(seconds: 2), () {
      int sum = 0;
      for (int i = 0; i < 1000000000; i++) {
        sum += i;
      }
      return sum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Heavy Computation')),
      body: Center(
        child: FutureBuilder<int>(
          future: heavyComputation(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Text('Result: ${snapshot.data}');
            }
          },
        ),
      ),
    );
  }
}
