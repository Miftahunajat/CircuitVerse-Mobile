import 'package:http/http.dart' as http;

class Resource<T> {
  final String url;
  T Function(http.Response response) parse;

  Resource({this.url, this.parse});
}

class Webservice {
  http.Client client = http.Client();
  Future<T> load<T>(Resource<T> resource) async {
    final response = await client.get(resource.url);
    if (response.statusCode == 200) {
      return resource.parse(response);
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
