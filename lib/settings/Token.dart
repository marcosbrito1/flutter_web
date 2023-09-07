import 'dart:convert';
import 'package:http/http.dart' as http;

class Token{

  Future<String> createToken() async {

    final response = await http.post(
      Uri.parse(''), //Entre as aspas simples digite a URL da sua API
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        //No corpo a requisição coloque os dados necessários para acessar a sua API e acessar o token
      }),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body); //Retorna os dados enviados pela API
    } else {
      throw Exception('Failed');
    }
  }

}