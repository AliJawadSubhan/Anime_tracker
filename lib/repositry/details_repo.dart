import 'dart:convert';
import 'dart:io';

import 'package:anime_tracing_app/data/network/network_api.dart';
import 'package:anime_tracing_app/model/anime_resp.dart';
import 'package:anime_tracing_app/utils/urls.dart';

class DetailsRepostiry {
  NetworkingApi netoworkingApi = NetworkingApi();
  Future<AnimeResponseModel> sendData(File? imageFile) async {
    final data = await netoworkingApi.postFiletoApi(
        baseUrl: ApiUrls.baseUrl, imageFile: imageFile);
    var json = jsonDecode(data);
    return AnimeResponseModel.fromJson(json);
  }
}
