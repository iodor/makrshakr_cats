import 'dart:convert';

import 'package:makrshakr_cats/model/catfact_model.dart';
import 'package:http/http.dart' as http;
import 'package:makrshakr_cats/constants/constants.dart' as constants;

class Service {
  Future<List<CatFactModel>> fetchCatFact() async{
    //CALL API
    final response = await http.get(Uri.parse(constants.URL_CATFACT_MODEL));
    if(response.statusCode == 200){
      final parse = json.decode(response.body)['data'] as List<dynamic>;
      final listCatFact = parse.map((e) => CatFactModel.fromJson(e)).toList();
      return listCatFact;
    }else{
      throw Exception('Error fetching Facts');
    }
  }
}