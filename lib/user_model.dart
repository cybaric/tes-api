import 'dart:convert';
import 'package:http/http.dart' as http;

class User{

  String id = '';
  String name = '';

  User({this.id = '', this.name = ''}); // konstruktor


    factory User.createUser(Map<String, dynamic> object){ // method untuk maping objek user dg data dr api, seteleh api diperoleh
      return User(
        id: object['id'].toString(),
        name: object['first_name'] + ' ' + object['last_name']

      );
  }

  static Future<User> connectToapi(String id) async{
    var apiUrl = Uri.parse('https://reqres.in/api/users/' + id); //menghubungkan ke link api

    var apiResult = await http.get(apiUrl); //mengambil dr api (get)

    var jsonObject = json.decode(apiResult.body); // membuat json objek

    var userData = (jsonObject as Map<String, dynamic>)['data']; // maping objek ke string (karna objek masih dlm objek lgi)

    return User.createUser(userData); // memanggil method
  }
}