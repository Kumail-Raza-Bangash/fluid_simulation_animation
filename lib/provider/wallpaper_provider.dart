import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_caller_theme_01/models/wallpaper_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WallpaperProvider extends ChangeNotifier {
  final List<Wallpaper> _wallpapers = [
    Wallpaper('VIP', 'lib/assets/gifs/G001.gif', true),
    Wallpaper('VIP', 'lib/assets/gifs/G002.gif', true),    
    Wallpaper('FEATURE', 'lib/assets/images/001.jpg', false),
    Wallpaper('NEW', 'lib/assets/images/003.jpg', false),
    Wallpaper('VIP', 'lib/assets/gifs/G004.gif', true),
    Wallpaper('FEATURE', 'lib/assets/images/004.jpg', false),
    Wallpaper('VIP', 'lib/assets/gifs/G003.gif', true),
    Wallpaper('TRENDING', 'lib/assets/images/005.jpg', false),
    Wallpaper('FEATURE', 'lib/assets/images/006.jpg', false),
    Wallpaper('VIP', 'lib/assets/gifs/G005.gif', true),
    Wallpaper('NEW', 'lib/assets/images/007.jpg', false),
    Wallpaper('TRENDING', 'lib/assets/images/008.jpg', false),
    Wallpaper('NEW', 'lib/assets/images/002.jpg', false),
  ];

  int _selectedIndex = 0;

  List<Wallpaper> get wallpapers => _wallpapers;

  Wallpaper get selectedWallpaper => _wallpapers[_selectedIndex];

  void selectWallpaper(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void setWallpaper(Wallpaper wallpaper) async {
    Wallpaper wallpaper = selectedWallpaper;

    // Show loading indicator
    try {
      // Set wallpaper using AsyncWallpaper
      bool success = await AsyncWallpaper.setWallpaperFromFile(
        filePath: wallpaper.imagePath,
        wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
        goToHome: false,
        toastDetails: ToastDetails.success(),
        errorToastDetails: ToastDetails.error(),
      );

      if (success) {
        // Show toast message
        Fluttertoast.showToast(
          msg: 'Wallpaper set successfully!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black.withOpacity(0.8),
          textColor: Colors.white,
        );
      } else {
        // Handle the case where setting the wallpaper was not successful
        Fluttertoast.showToast(
          msg: 'Error setting wallpaper',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red.withOpacity(0.8),
          textColor: Colors.white,
        );
      }
    } catch (e) {
      // Handle errors or show a message to the user
      Fluttertoast.showToast(
        msg: 'Error setting wallpaper: $e',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red.withOpacity(0.8),
        textColor: Colors.white,
      );
    }

    notifyListeners();
  }
}
