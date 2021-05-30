import 'dart:convert';
import 'package:http/http.dart' as http;

class PostResult {
  String id = '';
  String name = '';
  String job = '';
  String created = '';

  PostResult({this.id = '', this.name = '', this.job = '', this.created = ''}); // konstruktor membuat objek posresul dgn field kosong

  factory PostResult.createPostResult(Map<String, dynamic> object) { // method maping data dr api ke objek posresul yg akan dibuat
    return PostResult(
        id: object['id'],
        name: object['name'],
        job: object['job'],
        created: object['createdAt']);
  }

  static Future<PostResult> connectToAPI(String name, String job) async { 

    var apiurl = Uri.parse('https://reqres.in/api/users'); // menghubungkan ke link api

    var apiresult = await http.post(apiurl, body: {"name": name, "job": job}); // mengirim ke api (post)

    var jsonObject = json.decode(apiresult.body); // menerima objek kembalian dr api

    return PostResult.createPostResult(jsonObject); // memanggil method pembuat instance (factory)
  }
}
