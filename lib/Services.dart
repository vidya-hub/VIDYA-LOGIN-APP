import 'package:http/http.dart' as http;
import 'rest_api_i.dart';

class Services {
  static const String url = "https://picsum.photos/v2/list?page=2&limit=100";

  static Future<List<Imgjson>> getimg() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<Imgjson> imgs_js = imgjsonFromJson(response.body);
        return imgs_js;
      } else {
        return List<Imgjson>();
      }
    } catch (e) {
      return List<Imgjson>();
    }
  }
}
