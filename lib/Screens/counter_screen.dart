import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Provider/Provider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final counterProvider =
        Provider.of<CounterProvider>(context, listen: false,);
    Timer.periodic(Duration(seconds: 10), (timer) {
      counterProvider.Counterset();
    });
  }

  @override
  Widget build(BuildContext context) {
    final counterProvider =
    Provider.of<CounterProvider>(context, listen: false,);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Counter Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Container(
            child: Consumer<CounterProvider>(builder: (context,value,child){
              return Text(
                value.count.toString(),
                style: TextStyle(
                  fontSize: 30,

                ),
              );
            })
          )),
        ],
      ),
    );
  }
}
