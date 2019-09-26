import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:pokemon_app/Pokemon.dart';
import 'dart:io';

String url="https://pokeapi.co/api/v2/pokemon/";

Future<List<Pokemon>> getAllPokemon() async{
  final res=await http.get(url);
  print(res.body);
  return allPokemonFromJson(res.body);
}
Future<Pokemon> getPokemon() async {
  final res=await http.get('$url/1');
  return pokemonFromJson(res.body);
}