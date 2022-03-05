import 'dart:convert';
import 'package:http/http.dart';
import 'package:very_good_cli_project/model/kiishi_model.dart';

class TheAppService {
  final String _theLandingPoint = 'https://jsonkeeper.com/b/0U7X';

  Future<List<Kiishi>> getData() async {
    try {
      final _theUri = Uri.parse(_theLandingPoint);

      final _response = await get(_theUri);

      if (_response.statusCode == 200) {
        final _theConvertedJson = jsonDecode(_response.body) as List;

        Future<List<Kiishi>> _favourite = _theConvertedJson.map((Map<String, String>json) => Kiishi.fromJson(json)).toList()<Kiishi>;
        
        return _favourite;
      } else {
        throw Exception('Could not fetch data');
      }
    } catch (e) {
      rethrow;
    }
  }
}
