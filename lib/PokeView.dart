import 'package:flutter/material.dart';

class PokeView extends StatelessWidget{
  var pokemon;
  PokeView(var x){
    pokemon=x;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {Navigator.pop(context);},
              child: Icon(Icons.arrow_back,color: Colors.white,),
              foregroundColor: Colors.blue,
            ),
            backgroundColor: Colors.white,
            body: Container(padding: EdgeInsets.all(20),
              child: Column(children: <Widget>[
                Row(children: <Widget>[
                  Image.network(pokemon['image'],scale: 2,),
                  Expanded(child: Column(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
                    Text(pokemon['name'],textScaleFactor: 2,),
                    Text("Max HP: ${pokemon['maxHP']}" )
                  ],)
                    ,)
                ],),
                SizedBox(height: 16,),
                Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
                  Column(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
                    Text('Weight',textScaleFactor: 2,),
                    Text("Max Weight: ${pokemon['weight']['maximum']}" ),
                    Text("Minimum Weight: ${pokemon['weight']['minimum']}" ),
                  ],
                  ),Column(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
                    Text('Height',textScaleFactor: 2,),
                    Text("Max Height: ${pokemon['height']['maximum']}" ),
                    Text("Minimum Height: ${pokemon['height']['minimum']}" ),
                  ],)
                ],),
                SizedBox(height: 16,),

                Text('Attacks',textScaleFactor: 2,),
                SizedBox(height: 16,),
                SizedBox(width: 400,height: 300,child:
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[
                  Expanded(flex: 1,child:ListView.builder(
                      itemCount: pokemon['attacks']['fast'].length,
                      itemBuilder: (BuildContext context,int i){
                        return ListTile(
                          title: Text(pokemon['attacks']['fast'][i]['name'],textScaleFactor: 1.5,),
                          subtitle: Text("Damage: ${pokemon['attacks']['fast'][i]['name']}" ),
                        );
                      }),),
                  Expanded(flex:1,child:ListView.builder(
                      itemCount: pokemon['attacks']['special'].length,
                      itemBuilder: (BuildContext context,int i){
                        return ListTile(
                          title: Text(pokemon['attacks']['special'][i]['name'],textScaleFactor: 1.5,),
                          subtitle: Text("Damage: ${pokemon['attacks']['special'][i]['name']}" ),
                        );
                      }),)
                ],)

                  ,)
              ])
              ,),

    ));
  }
}