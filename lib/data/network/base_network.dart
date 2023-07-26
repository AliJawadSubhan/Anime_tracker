import 'dart:io';

abstract class BaseNetwork {
  Future<String> postFiletoApi({String baseUrl, File? imageFile});
}
