import 'package:flutter/material.dart';

class Err404Page extends StatelessWidget {
  const Err404Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("No page Found"),
      ),
      body: Center(
        child: Image.network(
          "https://phamdo18.com/wp-content/uploads/2020/05/nguyen-nhan-va-cach-khac-phuc-loi-404-not-found.png",
          width: 350,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
