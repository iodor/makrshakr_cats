import 'package:flutter/material.dart';
import 'package:makrshakr_cats/view_model/catfact_viewmodel.dart';

class DetailPage extends StatelessWidget {
  final CatFactViewModel catFactViewModel;

  DetailPage(this.catFactViewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CAT FACTS'),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child:
                  Image(image: NetworkImage('${catFactViewModel.urlImageCat}')),
            ),
            Container(
              child: Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(8.0),
                  scrollDirection: Axis.vertical,
                  child: Text(
                    '${catFactViewModel.catFactModel!.fact}',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: Container(
          height: 60,
          color: Colors.teal.shade700,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Column(
                children: <Widget>[
                  Icon(Icons.home, color: Colors.white,),
                  Text(
                    'Home',
                    style: TextStyle(
                      fontFamily: 'Dots',
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
