import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:makrshakr_cats/view_model/catfact_viewmodel.dart';

class DetailPage extends StatelessWidget {
  final CatFactViewModel catFactViewModel;

  DetailPage(this.catFactViewModel) {
    log('DETAIL PAGE');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CAT FACTS'),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                child:
                    Image(image: NetworkImage('${catFactViewModel.urlImageCat}')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About this fact',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      width: 160,
                      child: Divider(color: Colors.teal.shade900,),
                    ),
                    Text(
                      '${catFactViewModel.catFactModel!.fact}',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          color: Colors.teal.shade700,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
              log('BACK TO HOME');
            },
            child: Padding(
              padding: EdgeInsets.only(top: 2.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      fontFamily: 'Dots',
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
