import 'package:flutter/material.dart';
class Success extends StatelessWidget {
  const Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
          height: 200,
          width: 200,
           margin:const EdgeInsets.all(20),
            child: Image.asset("assets/success.png")),
      ),
    );
  }
}
