import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:makrshakr_cats/components/cardfact.dart';
import 'package:makrshakr_cats/view_model/catfact_viewmodel.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 1;
  int itemCount = 10;
  ListCatFactViewModel listCatFactViewModel = new ListCatFactViewModel();

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CAT FACTS'),
      ),
      body: SmartRefresher(
        enablePullUp: true,
        onRefresh: refresh,
        onLoading: loading,
        controller: refreshController,
        child: (listCatFactViewModel.facts != null)
            ? ListView.separated(
                itemBuilder: (context, index) {
                  return CardFact(listCatFactViewModel.facts![index]);
                },
                separatorBuilder: (context, index) => Divider(
                  color: Colors.grey[850],
                ),
                itemCount: itemCount,
              )
            : Center(),
      ),
    );
  }

  Future<void> refresh() async {
    log('RFRESH');
    currentPage = 1;
    itemCount = 10;
    await listCatFactViewModel.fetchFacts(currentPage, false);
    setState(() {});
    refreshController.refreshCompleted();
  }

  Future<void> loading() async {
    log('LOADING');
    currentPage++;
    await listCatFactViewModel.fetchFacts(currentPage, true);
    itemCount += 10;
    setState(() {});
    refreshController.loadComplete();
  }
}
