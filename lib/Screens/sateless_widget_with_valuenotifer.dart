import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NotiferListerner extends StatelessWidget {
  NotiferListerner({Key? key}) : super(key: key);
  ValueNotifier<bool> toogle = ValueNotifier<bool>(true);
  ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Value Notifer"),
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: toogle,
              builder: (context, value, child) {
                return TextFormField(
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                    onTap: () {
                      toogle.value = !toogle.value;
                    },
                    child: Icon(
                        toogle.value ? Icons.visibility : Icons.visibility_off),
                  )),
                  obscureText: toogle.value,
                );
              }),
          ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) {
                return Text(_counter.value.toString(),style: TextStyle(fontSize: 30),);
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
