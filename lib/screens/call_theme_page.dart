import 'package:flutter/material.dart';
import 'package:flutter_caller_theme_01/provider/call_theme_provider.dart';
import 'package:provider/provider.dart';

class CallThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call Theme'),
      ),
      body: Consumer<CallThemeProvider>(
        builder: (context, provider, child) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: provider.availableImages.length,
            itemBuilder: (context, index) {
              final imagePath = provider.availableImages[index];
              return InkWell(
                onTap: () {
                  provider.setBackgroundImage(imagePath);
                  // Update system incoming call background image
                  // Call the method to set background for system incoming calls here
                  _setSystemIncomingCallBackground(imagePath);
                },
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        },
      ),
    );
  }

  // Method to set the background image for system incoming calls
  void _setSystemIncomingCallBackground(String imagePath) {
    // Implement code here to set the background image for system incoming calls
    // This may involve using platform-specific code or packages like 'callkeep'
    // For example, if using 'callkeep':
    // CallKeep.instance.setBackgroundImage(imagePath);
    // Ensure proper handling for platform-specific logic.
  }
}
