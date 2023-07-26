import 'dart:developer' show log;

import 'package:anime_tracing_app/model/anime_resp.dart';
import 'package:anime_tracing_app/repositry/details_repo.dart';
import 'package:anime_tracing_app/views/details/details_view.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

abstract class DetailsViewModel extends State<DetailsView> {
  late VideoPlayerController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log('this is init');
    repo.sendData(widget.animeImage);
  }

  final repo = DetailsRepostiry();
  Future<AnimeResponseModel> getResultFromApi() {
    return repo.sendData(widget.animeImage);
  }

  double checkDouble(dynamic value) {
    if (value is String) {
      return double.parse(value);
    } else {
      return value.toDouble();
    }
  }
}
