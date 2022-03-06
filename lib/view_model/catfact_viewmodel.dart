import 'package:makrshakr_cats/model/catfact_model.dart';
import 'package:makrshakr_cats/service/service.dart';

class ListCatFactViewModel{
  List<CatFactViewModel>? facts;

  Future<void> fetchFacts() async {
    final result = await Service().fetchCatFact();
    facts = result.map((e) => CatFactViewModel(e)).toList();
  }
}

class CatFactViewModel{
  final CatFactModel catFactModel;

  CatFactViewModel(this.catFactModel);
}




