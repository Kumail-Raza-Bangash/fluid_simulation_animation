
import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_caller_theme_01/models/wallpaper_model.dart';
import 'package:flutter_caller_theme_01/provider/wallpaper_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class WallpaperDetailPage extends StatefulWidget {
  final Wallpaper wallpaper;

  const WallpaperDetailPage({Key? key, required this.wallpaper}) : super(key: key);

  @override
  State<WallpaperDetailPage> createState() => _WallpaperDetailPageState();
}

class _WallpaperDetailPageState extends State<WallpaperDetailPage> {
  @override
  Widget build(BuildContext context) {
    var wallpaperProvider = Provider.of<WallpaperProvider>(context);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          buildWallpaperImage(),
          buildBackButton(),
          buildActionButtons(),
          buildSetWallpaperButton(wallpaperProvider),
        ],
      ),
    );
  }

  Widget buildWallpaperImage() {
    return Image.asset(
      widget.wallpaper.imagePath,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }

  Widget buildBackButton() {
    return Positioned(
      top: 40.0,
      left: 16.0,
      child: buildTextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        iconPath: 'lib/assets/icons/back.png',
      ),
    );
  }

  Widget buildActionButtons() {
    return Positioned(
      top: 40.0,
      right: 16.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildTextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            iconPath: 'lib/assets/icons/share.png',
          ),
          const SizedBox(width: 16.0),
          buildTextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            iconPath: 'lib/assets/icons/detail.png',
          ),
        ],
      ),
    );
  }

  Widget buildSetWallpaperButton(WallpaperProvider wallpaperProvider) {
    return Positioned(
      bottom: 24.0,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: SizedBox(
          width: 150.0,
          height: 50.0,
          child: ElevatedButton(
            onPressed: () {
              setWallpaper(wallpaperProvider); // Call the method to set wallpaper
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black.withOpacity(0.4),
            ),
            child: const Text(
              'Set Wallpaper',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
        ),
      ),
    );
  }


  void setWallpaper(WallpaperProvider wallpaperProvider) async {
  Wallpaper wallpaper = widget.wallpaper;

  // Show loading indicator
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );

  try {
    // Set wallpaper using AsyncWallpaper
    bool success = await AsyncWallpaper.setWallpaperFromFile(
      filePath: wallpaper.imagePath,  // Assuming imagePath is the URL of the wallpaper
      wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
      goToHome: false, // Set to your desired value
      toastDetails: ToastDetails.success(),
      errorToastDetails: ToastDetails.error(), 
    );

    // Hide loading indicator
    // ignore: use_build_context_synchronously
    Navigator.pop(context);

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
    // Hide loading indicator
    // ignore: use_build_context_synchronously
    Navigator.pop(context);

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
}



  Widget buildTextButton({
    required VoidCallback onPressed,
    required String iconPath,
  }) {
    return SizedBox(
      width: 50.0,
      height: 40.0,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black.withOpacity(0.4)),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
        ),
        child: Image.asset(
          iconPath,
          width: 20.0,
          height: 20.0,
          color: Colors.white,
        ),
      ),
    );
  }
}