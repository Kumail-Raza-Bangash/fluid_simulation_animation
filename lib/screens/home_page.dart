import 'package:flutter/material.dart';
import 'package:flutter_caller_theme_01/models/wallpaper_model.dart';
import 'package:flutter_caller_theme_01/provider/tab_provider.dart';
import 'package:flutter_caller_theme_01/provider/wallpaper_provider.dart';
import 'package:flutter_caller_theme_01/screens/image_details.dart';
import 'package:flutter_caller_theme_01/widgets/card_widget.dart';
import 'package:flutter_caller_theme_01/widgets/tabbar_widget.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final wallpaperProvider = Provider.of<WallpaperProvider>(context);
    final tabProvider = Provider.of<TabProvider>(context);

    List<Wallpaper> getWallpapersForTab() {
      switch (tabProvider.currentIndex) {
        case 0:
          return wallpaperProvider.getAllWallpapers();
        case 1:
          return wallpaperProvider.getVipWallpapers();
        case 2:
          return wallpaperProvider.getNewWallpapers();
        case 3:
          return wallpaperProvider.getTrendingWallpapers();
        case 4:
          return wallpaperProvider.getFeatureWallpapers();
        default:
          return wallpaperProvider.getAllWallpapers();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallpaper App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Implement logic for settings
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const TabBarWidget(),
          Expanded(
            child: GridView.builder(
              itemCount: getWallpapersForTab().length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.55,
              ),
              itemBuilder: (context, index) {
                final wallpaper = getWallpapersForTab()[index];
                return InkWell(
                  onTap: () {
                    // Navigate to WallpaperDetailPage when tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WallpaperDetailPage(wallpaper: wallpaper),
                      ),
                    );
                  },
                  child: CardWidget(
                    imagePath: wallpaper.imagePath,
                    name: wallpaper.name,
                    isVip: wallpaper.isVip,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}