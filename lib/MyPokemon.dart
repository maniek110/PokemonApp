import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pokemon_app/PokeView.dart';


class MyPokemon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink =
    HttpLink(uri: 'https://graphql-pokemon.now.sh');

    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: httpLink as Link,
        cache: OptimisticCache(
          dataIdFromObject: typenameDataIdFromObject,
        ),
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GraphQLProvider(
        child: HomePage(),
        client: client,
      ),
    );
  }
}

class HomePage extends StatelessWidget {

  final String query = r'''
                    query getPoks{
  pokemons(first: 10) {
    name
    height{minimum,maximum}
    weight{minimum,maximum}
    maxHP
    image
    attacks{
      fast{
        name
        damage
      }
      special{
        name
        damage
      }
    }
  }
}

                  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Poke List"),
        ),
        body: Query(
          options: QueryOptions(
              document: query),
          builder: (QueryResult result, {VoidCallback refetch}) {
            if (result.loading) {
              return Center(child: CircularProgressIndicator());
            }

            if (result.data == null) {
              return Center(child: Text('Pokemons are hidding in the bush.'));
            }

            return _pokeList(result);
          },
        ));
  }

  Container _pokeList(QueryResult result) {
    final pokeList=result.data['pokemons'];
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: pokeList.length,
        itemBuilder: (BuildContext context,int index) {
          return new Container(color: Colors.white,
            child: ListTile(
                title: Text(pokeList[index]['name'],textAlign: TextAlign.center,),
                subtitle: Text('maxHP: ${pokeList[index]['maxHP']}',textAlign: TextAlign.center,),
                leading: Image.network(pokeList[index]['image']),
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>PokeView(pokeList[index])))
            ),
          );},

      ),
    );
  }

}

