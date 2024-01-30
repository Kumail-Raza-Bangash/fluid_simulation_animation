import 'package:flutter/material.dart';
import 'package:flutter_caller_theme_01/provider/wallpaper_provider.dart';
import 'package:flutter_caller_theme_01/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WallpaperProvider(),
      child: const MaterialApp(
        home: MyApp(), // Change this line to use MyApp() instead of HomePage()
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
