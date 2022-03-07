import 'package:makrshakr_cats/model/catfact_model.dart';
import 'package:makrshakr_cats/service/service.dart';
import 'dart:math';

class ListCatFactViewModel{
  List<CatFactViewModel>? facts;

  Future<void> fetchFacts(int page, bool load) async {
    final result = await Service().fetchCatFact(page);
    List<CatFactViewModel> temp = result.map((e) => CatFactViewModel(e)).toList();

    if(load){
      facts!.addAll(temp);
    }else{
      facts = temp;
    }
  }
}

class CatFactViewModel{
  CatFactModel? catFactModel;
  String? urlImageCat;

  CatFactViewModel(CatFactModel catFactModel){
    this.catFactModel = catFactModel;

    int randomNumber = Random().nextInt(500)+500;
    this.urlImageCat = 'http://placekitten.com/$randomNumber/$randomNumber';
  }
}




