import 'package:flutter/material.dart';
import 'package:makrshakr_cats/model/catfact_model.dart';

class CardFact extends StatelessWidget {
  final CatFactModel catFactModel;

  CardFact(this.catFactModel);


  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade500,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: TextButton(
        onPressed: (){print('ciao');},
        child: const ListTile(
          leading: Image(
            image: NetworkImage('http://placekitten.com/g/100/100'),
          ),
          title: Text(
            'Fatcfac tsdasdasdsaasdasdasdasdasdas',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontFamily: 'SourceSansPro',
            ),
          ),
          subtitle: Text(
            'Length: 2',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontFamily: 'SourceSansPro',
            ),
          ),
        ),
      ),
    );
  }
}
