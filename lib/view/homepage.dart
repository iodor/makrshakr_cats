import 'package:flutter/material.dart';
import 'package:makrshakr_cats/view_model/catfact_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var body = Container(
    child: Column(
      children: [
        Card(
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
        )
      ],
    ),
  );


  ListCatFactViewModel listCatFactViewModel = new ListCatFactViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Makr Shakr Cats',
          style: TextStyle(
            fontFamily: 'Dots',
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.grey.shade500,
      ),
      body: FutureBuilder(
        future: listCatFactViewModel.fetchFacts(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else{
            return Container(
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: listCatFactViewModel.facts!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                  itemBuilder: (BuildContext context, int index){
                    return Card(
                      color: Colors.grey.shade500,
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: TextButton(
                        onPressed: (){print('ciao');},
                        child: ListTile(
                          leading: Image(
                            image: NetworkImage('http://placekitten.com/g/100/100'),
                          ),
                          title: Text(
                            '${listCatFactViewModel.facts![index].catFactModel.fact}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontFamily: 'SourceSansPro',
                            ),
                          ),
                          subtitle: Text(
                            'Length: ${listCatFactViewModel.facts![index].catFactModel.length}',
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
              ),
            );
          }
        },
      )
    );
  }
}
