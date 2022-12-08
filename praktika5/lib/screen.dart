import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class Screen extends StatelessWidget {
  const Screen({super.key, required this.count});

  final int count; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(count.toString() , style: TextStyle(fontSize: 125)), 

    );
      
  }


  
}






