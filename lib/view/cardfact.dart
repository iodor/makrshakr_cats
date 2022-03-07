import 'package:flutter/material.dart';
import 'package:makrshakr_cats/view/detailpage.dart';
import 'package:makrshakr_cats/view_model/catfact_viewmodel.dart';

class CardFact extends StatelessWidget {
  final CatFactViewModel catFactViewModel;

  CardFact(this.catFactViewModel);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          width: 55,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: NetworkImage('${catFactViewModel.urlImageCat}'),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          // child: Image(
          //   image: NetworkImage('${catFactViewModel.urlImageCat}'),
          // ),
        ),
        title: Text(
          '${catFactViewModel.catFactModel!.fact}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          'Length: ${catFactViewModel.catFactModel!.length}',
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailPage(catFactViewModel)));
        },
      ),
    );
  }
}
