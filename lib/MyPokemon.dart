import 'package:flutter/material.dart';
import 'package:pokemon_app/Pokemon.dart';
import 'package:pokemon_app/Service.dart';

import 'MyColors.dart';

class MyPokemon extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_MyPokemon();
}

class _MyPokemon extends State<MyPokemon>{
  @override
  Widget build(BuildContext context) {
    Widget albumView(double maxHeight,double maxWidth){
      return new Container(
          color: MyColors.c2,
          height: maxHeight,
          child: Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0),child:
          Column(children: <Widget>[
            SizedBox(height: 16,),
            SizedBox(height: 32,child: Text("Here is your 10 pokemons",style: TextStyle(fontSize: 30),),),
            SizedBox(height:maxHeight/1.3, child:
            CustomScrollView(
              primary: false,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverGrid.count(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: <Widget>[
                      FutureBuilder<Pokemon>(
                        future: getPokemon(),
                        builder: (context,x){
                          return
                            Container(
                              padding: const EdgeInsets.all(8),
                              child:  Text('${x.data.name}'),
                              color: Colors.green[600],
                            );
                        },
                      )
                    ],
                  ),
                ),
              ],
            )
            ),

          ],),)
      );
    }

    double maxHeight=MediaQuery.of(context).size.height;
    double maxWidth=MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body:albumView(maxHeight, maxWidth),
      ),

    );
  }

}
