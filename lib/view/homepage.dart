import 'package:flutter/material.dart';
import 'package:makrshakr_cats/view/cardfact.dart';
import 'package:makrshakr_cats/view_model/catfact_viewmodel.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 1;
  int itemCount = 10;
  ListCatFactViewModel listCatFactViewModel = new ListCatFactViewModel();

  // final RefreshController refreshController = RefreshController(initialRefresh: true);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CAT FACTS'),
        ),
        body: RefreshIndicator(
          onRefresh: refresh,
          child: FutureBuilder(
            future: listCatFactViewModel.fetchFacts(currentPage, []),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container(
                  child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: listCatFactViewModel.facts!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisExtent: 80,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        currentPage++;
                        return CardFact(listCatFactViewModel.facts![index]);
                      }),
                );
              }
            },
          ),
        ));
  }

  Future<void> refresh() async{
    setState(() {
      listCatFactViewModel.fetchFacts(currentPage, []);
    });
  }

  // Future<void> loading() async{
  //   setState(() {
  //     currentPage++;
  //     listCatFactViewModel.fetchFacts(currentPage, listCatFactViewModel.facts!);
  //     itemCount+=10;
  //   });
  //
  //
  //   refreshController.loadComplete();
  // }
}
