import 'package:flutter/material.dart';
import 'package:flutter_caller_theme_01/provider/wallpaper_provider.dart';
import 'package:flutter_caller_theme_01/screens/image_details.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var wallpaperProvider = Provider.of<WallpaperProvider>(context);

    // Replace the following code with your logic for displaying wallpapers
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: wallpaperProvider.wallpapers.length,
        itemBuilder: (context, index) {
          var wallpaper = wallpaperProvider.wallpapers[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WallpaperDetailPage(wallpaper: wallpaper),
                ),
              );
            },
            child: Card(
              child: Image.asset(wallpaper.imagePath, fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}
