// To parse this JSON data, do
//
//     final modelPokemon = modelPokemonFromJson(jsonString);

import 'dart:convert';

ModelPokemon modelPokemonFromJson(String str) =>
    ModelPokemon.fromJson(json.decode(str));

String modelPokemonToJson(ModelPokemon data) => json.encode(data.toJson());

class ModelPokemon {
  ModelPokemon({
    required this.count,
    required this.next,
    this.previous,
    required this.results,
  });

  final int count;
  final String next;
  final dynamic previous;
  final List<DetailPokemon> results;

  factory ModelPokemon.fromJson(Map<String, dynamic> json) => ModelPokemon(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<DetailPokemon>.from(
            json["results"].map((x) => DetailPokemon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

DetailPokemon detailPokemonFromJson(String str) =>
    DetailPokemon.fromJson(json.decode(str));

String detailPokemonToJson(DetailPokemon data) => json.encode(data.toJson());

class DetailPokemon {
  DetailPokemon({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory DetailPokemon.fromJson(Map<String, dynamic> json) => DetailPokemon(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
