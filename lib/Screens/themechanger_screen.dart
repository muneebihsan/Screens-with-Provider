import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Provider/themechanger_with_provider.dart';

class ThemeChangerScreen extends StatefulWidget {
  const ThemeChangerScreen({Key? key}) : super(key: key);

  @override
  State<ThemeChangerScreen> createState() => _ThemeChangerScreenState();
}

class _ThemeChangerScreenState extends State<ThemeChangerScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context,);
    print('builder');
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Screen'),
      ),
      body: Container(
        child: Column(
          children: [
            RadioListTile<ThemeMode>(
                title: Text("light mode"),
                value: ThemeMode.light,
                groupValue: themeProvider.theme,
                onChanged:(theme){
                  themeProvider.themeset(theme);
                }),
            RadioListTile<ThemeMode>(
                title: Text("Dark mode"),
                value: ThemeMode.dark,
                groupValue: themeProvider.theme,
                onChanged: themeProvider.themeset),
            RadioListTile<ThemeMode>(
                title: Text("system mode"),
                value: ThemeMode.system,
                groupValue: themeProvider.theme,
                onChanged: themeProvider.themeset),
          ],
        ),
      ),
    );
  }
}
