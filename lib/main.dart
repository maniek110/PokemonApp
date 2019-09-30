import 'package:flutter/material.dart';
import 'package:pokemon_app/MyPokemon.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Pokemon App',
  theme: ThemeData(
  backgroundColor: Colors.blue,
  ),
  home: new nextScreen()
  );
  }
  }

  class nextScreen extends StatelessWidget{
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.blue,
        body: GestureDetector(child:
        Center(child:
        new Image.asset("assets/images/title.png",
        fit: BoxFit.cover,
        alignment: Alignment.center,
        ),
        ),
          onTap: ()=>Navigator.push(context,
  MaterialPageRoute(builder: (context)=>MyPokemon())
  ),
  ),

  );
  }
}