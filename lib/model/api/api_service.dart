import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  Future<dynamic> fetchNewsData(data) async {
    final response = await http.get(Uri.parse('https://inshorts.deta.dev/news?category=${data}'));
    return jsonDecode(response.body);
  }
}
