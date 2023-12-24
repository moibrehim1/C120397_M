import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String btnText;
  final VoidCallback onTap; // Use 'VoidCallback' instead of 'Voidcallback'
  
  const MyButton({Key? key, required this.btnText, required this.onTap}) : super(key: key); // Use 'Key?' instead of 'super.key'

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Use 'onTap' instead of 'onTar'
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 39, 94, 223), // Use '255' instead of 'FrOmARGE' and fix the color values
          borderRadius: BorderRadius.circular(20),
        ),
        width: double.infinity,
        height: 65,
        child: Center(
          child: Text(
            btnText,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
