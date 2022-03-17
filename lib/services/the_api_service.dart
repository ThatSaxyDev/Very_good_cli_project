import 'dart:convert';
import 'package:http/http.dart';
import 'package:very_good_cli_project/model/kiishi_model.dart';

// class TheApiService {
//   final String _theLandingPoint = 'https://jsonkeeper.com/b/0U7X';

//   Future<List<Kiishi>> getData() async {
//     try {
//       final _theUri = Uri.parse(_theLandingPoint);

//       final _response = await get(_theUri);

//       if (_response.statusCode == 200) {
//         final _theConvertedJson = jsonDecode(_response.body) as List;

//         // ignore: lines_longer_than_80_chars
//         Future<List<Kiishi>> _favourite = _theConvertedJson.map((Map<String, String>json) => Kiishi.fromJson(json)).toList()<Kiishi>;
        
//         return _favourite;
//       } else {
//         throw Exception('Could not fetch data');
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

abstract class TheApiService {
  Future<List<MediaItem>> getItems();
  Future<List<MediaItem>> addItem({
    required MediaItemDTO mediaItemDTO,
  });
}

class TheApiServiceImpl implements TheApiService {
  final _baseUrl = 'https://jsonkeeper.com/b/0U7X';

  @override
  Future<List<MediaItem>> getItems() async {
    final _theApiUrl = 'https://jsonkeeper.com/b/0U7X';
    try {
      final _resp = await _networkUtil.getReq(_theApiUrl);

      return MediaItemResult.fromJson(_resp).data;
    } on FormatException {
      throw Failure(
        message: 'Bad response format.',
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaItem>> addItem({required MediaItemDTO mediaItemDTO}) async {
    final _mediaApiUrl = '$_baseUrl/b/B7IO';
    try {
      final _resp = await _networkUtil.postReq(
        _mediaApiUrl,
        body: mediaItemDTO.toString(),
      );

      return MediaItemResult.fromJson(_resp).data;
    } on FormatException {
      throw Failure(
        message: 'Bad response format.',
      );
    } catch (e) {
      rethrow;
    }
  }
}

