import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyText extends StatelessWidget {
  final String MylableText;
  final double FontSize;
  final TextEditingController myController;
  const MyText({
    super.key,
    required this.MylableText,
    required this.FontSize,
     required this.myController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
        decoration: InputDecoration(
              hintText: 'Enter text...',
        )
      
    );
    
  }
}
