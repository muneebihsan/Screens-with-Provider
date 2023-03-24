import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Provider/Provider.dart';
import 'package:untitled/Screens/counter_screen.dart';
import 'package:untitled/Provider/slider_with_provider.dart';
import 'package:untitled/Screens/slider_screen.dart';
import 'package:untitled/Screens/favorite_screen.dart';
import 'package:untitled/Provider/favorite_with_provider.dart';
import 'package:untitled/Screens/themechanger_screen.dart';
import 'package:untitled/Provider/themechanger_with_provider.dart';
import 'package:untitled/Screens/sateless_widget_with_valuenotifer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SliderProvider(),
        ),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Builder(builder: (context) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                appBarTheme: AppBarTheme(color: Colors.teal),
                primaryColor: Colors.green),
            themeMode: themeProvider.theme,
            title: 'Flutter with provider ',
            theme: ThemeData(
              primarySwatch: Colors.indigo,
            ),
            home:  NotiferListerner());
      }),
    );
  }
}
