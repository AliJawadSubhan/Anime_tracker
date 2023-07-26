import 'package:anime_tracing_app/views/home/home_Viewmodel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: TextButton(
            onPressed: () {
              pickImage();
            },
            child: Text('Upload Image'),
          )),
        ],
      ),
    );
  }
}
