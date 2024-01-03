import 'dart:convert';
import 'package:http/http.dart' as http;

class DataApi {
  final String baseUrl =
      'https://crudcrud.com/api/958eeb3668f14463b0782f6d0ffa40f3';

  getAllData({required String url}) async {
    try {
      final response = await http.get(Uri.parse(baseUrl + url));
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body.toString());
        return responseData;
      }
    } catch (e) {
      rethrow;
    }
  }

  postDate({required String url, required Map<String, dynamic> data}) async {
    try {
      String jsonData = json.encode(data);
      final response = await http.post(
        Uri.parse(baseUrl + url),
        body: jsonData,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 201) {
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  putData({required String url, required Map<String, dynamic> data}) async {
    try {
      String jsonData = json.encode(data);
      final response = await http.put(
        Uri.parse(baseUrl + url),
        body: jsonData,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  deleteData({required String url}) async {
    try {
      final response = await http.delete((Uri.parse(baseUrl + url)));
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }
}
