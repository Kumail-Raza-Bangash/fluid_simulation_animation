import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final bool isVip;

  const CardWidget({
    Key? key,
    required this.imagePath,
    required this.name,
    this.isVip = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        child: Stack(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),

            // Condition to show the top-right icon
            if (isVip && name == "VIP") 
              Positioned(
                top: 8.0,
                right: 8.0,
                child: _buildVipIcon(),
              ),

            // Bottom Text
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildBottomText(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVipIcon() {
    return TextButton(
      onPressed: () {
        // Handle the button press
        // You can add your logic here
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
        minimumSize: MaterialStateProperty.all<Size>(const Size(60.0, 25.0)), // Adjust the height
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'VIP',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(width: 7.0),
          Image.asset(
            'lib/assets/icons/vip-crown.png', // Adjust the path
            width: 16.0, // Set width as needed
            height: 16.0, // Set height as needed
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomText() {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Text(
            name,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}