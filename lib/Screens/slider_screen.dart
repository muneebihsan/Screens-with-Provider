import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Provider/slider_with_provider.dart';
class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Consumer<SliderProvider>(builder: (context,value,child){
             return
               Slider(min: 0,
                   max: 1,
                   value: value.value, onChanged: (val) {
                     print(val);
                     value.sliderValue(val);
                   });
           }),
            Row(
              children: [
              Consumer<SliderProvider>(builder: (context,value,child){
                return   Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.red.withOpacity(value.value),
                      child: Center(child: Text("Container 1")),
                    ));
              }),
               Consumer<SliderProvider>(builder: (context,value,child){
                 return  Expanded(
                     child: Container(
                       height: 100,
                       color: Colors.green.withOpacity(value.value),
                       child: Center(child: Text("Container 2")),
                     ));
               })
              ],
            )
          ],
        ),
      ),
    );
  }
}
