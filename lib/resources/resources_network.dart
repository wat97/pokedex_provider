class ResourcesNetwork {
  static const urlApi = "https://pokeapi.co/api/v2/";

  String get baseUrl => urlApi;

  String get pokemonUrl => "${baseUrl}pokemon";
}
