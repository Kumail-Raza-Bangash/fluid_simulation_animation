import 'package:flutter/material.dart';
import 'package:flutter_caller_theme_01/provider/tab_provider.dart';
import 'package:flutter_caller_theme_01/provider/wallpaper_provider.dart';
import 'package:flutter_caller_theme_01/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WallpaperProvider()),
        ChangeNotifierProvider(create: (context) => TabProvider()),
      ],
      child: MaterialApp(
        title: 'Wallpaper App',
        theme: ThemeData(
          // Your app theme configurations go here
        ),
        home:  const MyHomePage(), // Entry point is HomeScreen.dart
      ),
    );
  }
}