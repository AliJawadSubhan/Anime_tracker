class AnimeResponseModel {
  int? frameCount;
  String? error;
  List<Result>? result;

  AnimeResponseModel({this.frameCount, this.error, this.result});

  AnimeResponseModel.fromJson(Map<String, dynamic> json) {
    frameCount = json["frameCount"];
    error = json["error"];
    result = json["result"] == null
        ? null
        : (json["result"] as List).map((e) => Result.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["frameCount"] = frameCount;
    _data["error"] = error;
    if (result != null) {
      _data["result"] = result?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Result {
  Anilist? anilist;
  String? filename;
  dynamic episode;
  num? from;
  num? to;
  num? similarity;
  String? video;
  String? image;

  Result(
      {this.filename,
      this.episode,
      this.from,
      this.to,
      this.similarity,
      this.video,
      this.image});

  Result.fromJson(Map<String, dynamic> json) {
    anilist =
        json['anilist'] != null ? Anilist.fromJson(json['anilist']) : null;
    filename = json["filename"];
    episode = json["episode"];
    from = json["from"];
    to = json["to"];
    similarity = json["similarity"];
    video = json["video"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (this.anilist != null) {
      _data['anilist'] = this.anilist!.toJson();
    }
    _data["filename"] = filename;
    _data["episode"] = episode;
    _data["from"] = from;
    _data["to"] = to;
    _data["similarity"] = similarity;
    _data["video"] = video;
    _data["image"] = image;
    return _data;
  }
}

class Anilist {
  num? id;
  num? idMal;
  Title? title;
  List<String>? synonyms;
  bool? isAdult;

  Anilist({this.id, this.idMal, this.title, this.synonyms, this.isAdult});

  Anilist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idMal = json['idMal'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    synonyms = json['synonyms'].cast<String>();
    isAdult = json['isAdult'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idMal'] = this.idMal;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['synonyms'] = this.synonyms;
    data['isAdult'] = this.isAdult;
    return data;
  }
}

class Title {
  String? native;
  String? romaji;
  // ignore: prefer_typing_uninitialized_variables
  var english;

  Title({this.native, this.romaji, this.english});

  Title.fromJson(Map<String, dynamic> json) {
    native = json['native'];
    romaji = json['romaji'];
    english = json['english'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['native'] = this.native;
    data['romaji'] = this.romaji;
    data['english'] = this.english;
    return data;
  }
}
