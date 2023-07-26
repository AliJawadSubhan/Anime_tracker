import 'dart:io';

import 'package:anime_tracing_app/views/details/details_view.dart';
import 'package:flutter/material.dart';

import 'package:anime_tracing_app/views/home/home_View.dart' show HomeScreen;
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

abstract class HomeViewModel extends State<HomeScreen> {
  final picker = ImagePicker();
  File? animeImage;

  Future pickImage() async {
    final pickedImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedImage != null) {
      setState(() {
        animeImage = File(pickedImage.path);
      });
      // ignore: use_build_context_synchronously
      await Navigator.push(context, MaterialPageRoute(builder: (c) {
        return DetailsView(animeImage: animeImage);
      }));
    }
  }
}
