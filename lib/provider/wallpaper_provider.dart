import 'package:flutter/material.dart';
import 'package:flutter_caller_theme_01/models/wallpaper_model.dart';

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
    //Wallpaper('NEW', 'lib/assets/images/007.jpg', false),
    //Wallpaper('TRENDING', 'lib/assets/images/008.jpg', false),
    Wallpaper('NEW', 'lib/assets/images/002.jpg', false),
  ];

  int _selectedIndex = 0;

  List<Wallpaper> get wallpapers => _wallpapers;

  Wallpaper get selectedWallpaper => _wallpapers[_selectedIndex];

  String? get wallpaperUrl => null;

  void selectWallpaper(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  List<Wallpaper> getAllWallpapers() {
    return _wallpapers;
  }

  List<Wallpaper> getVipWallpapers() {
    return _wallpapers.where((wallpaper) => wallpaper.name == 'VIP').toList();
  }

  List<Wallpaper> getNewWallpapers() {
    return _wallpapers.where((wallpaper) => wallpaper.name == 'NEW').toList();
  }

  List<Wallpaper> getTrendingWallpapers() {
    return _wallpapers.where((wallpaper) => wallpaper.name == 'TRENDING').toList();
  }

  List<Wallpaper> getFeatureWallpapers() {
    return _wallpapers.where((wallpaper) => wallpaper.name == 'FEATURE').toList();
  }
}