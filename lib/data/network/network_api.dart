import 'dart:developer';
import 'dart:io';
import 'package:anime_tracing_app/data/exception/exception.dart';
import 'package:http/http.dart' as http;
import 'package:anime_tracing_app/data/network/base_network.dart';

class NetworkingApi extends BaseNetwork {
  dynamic responseJson;
  @override
  Future<String> postFiletoApi({String? baseUrl, File? imageFile}) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(baseUrl!));
      var multiPart =
          await http.MultipartFile.fromPath('image', imageFile!.path);
      request.files.add(multiPart);
      var response = await request.send();
      var responseData = await response.stream.toBytes();
      if (response.statusCode == 400) {
        throw FailureExceptions(
            'Invalid image URL / Failed to process image / OpenCV: Failed to detect and cut borders');
      } else if (response.statusCode == 403) {
        throw FailureExceptions('Invalid API key');
      } else if (response.statusCode == 405) {
        throw FailureExceptions('Method Not Allowed');
      } else if (response.statusCode < 299 || response.statusCode > 200) {
        var result = String.fromCharCodes(responseData);
        log(result);
        return result;
      } else {
        return '';
      }
    } on SocketException {
      throw FailureExceptions('Internet Exception');
    }
  }
}
