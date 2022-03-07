import 'dart:convert';
import 'dart:developer';
import 'package:makrshakr_cats/model/catfact_model.dart';
import 'package:http/http.dart' as http;
import 'package:makrshakr_cats/constants/constants.dart';


class Service {

  Future<List<CatFactModel>> fetchCatFact(int page) async{
    log('CALL API');
    final response = await http.get(Uri.parse('${CAT_FACT.URL_CATFACT_MODEL}?page=$page&limit=10'));
    if(response.statusCode == 200){
      final parse = json.decode(response.body)['data'] as List<dynamic>;
      print(json.decode(response.body)['data']);
      final listCatFact = parse.map((e) => CatFactModel.fromJson(e)).toList();
      return listCatFact;
    }else{
      throw Exception('Error fetching Facts');
    }
  }
}