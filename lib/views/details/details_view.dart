// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';
import 'package:anime_tracing_app/model/anime_resp.dart';
import 'package:anime_tracing_app/views/details/details_Viewmodel.dart';
import 'package:anime_tracing_app/views/details/widgets/Video_player.dart';
import 'package:anime_tracing_app/views/details/widgets/calculated_Text.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({
    Key? key,
    required this.animeImage,
  }) : super(key: key);
  final File? animeImage;
  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends DetailsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        actions: [
          widget.animeImage == null
              ? const Text('failed')
              : Image.file(
                  File(
                    widget.animeImage!.path,
                  ),
                  fit: BoxFit.fill,
                ),
        ],
      ),
      body: Center(
        child: FutureBuilder<AnimeResponseModel>(
          future: getResultFromApi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: ${snapshot.error}',
                    style: const TextStyle(color: Colors.red, fontSize: 18),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Retry fetching data on button press
                      // You may want to update the Future here.
                      getResultFromApi();
                    },
                    child: Text('Retry'),
                  ),
                ],
              );
            }

            if (snapshot.data == null || snapshot.data!.result == null) {
              return Text(snapshot.data!.error.toString());
            }

            final result = snapshot.data!.result![0];

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigate to the detailed view of the anime
                    // You can use Navigator.push to navigate to the new page.
                  },
                  child: VideoPlayerWidget(videoUrl: result.video.toString()),
                ),
                const SizedBox(height: 16),
                Text(
                  result.anilist?.title?.romaji ?? 'Title Not Available',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Episode: ${result.episode ?? "Unknown"}',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                calculatedWidget(result.similarity!),
                // Text(),
              ],
            );
          },
        ),
      ),
    );
  }
}
