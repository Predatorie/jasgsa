import 'package:dio/dio.dart';
import 'package:jagsa/secrets/secrets.dart';
import 'package:jagsa/src/models/steam_games_model.dart';
import 'package:jagsa/src/models/steam_player_model.dart';
import 'package:jagsa/src/repositories/isteam_repo.dart';

class SteamRepository implements ISteamRepository {
  SteamRepository({this.dio});
  final Dio dio;

  @override
  Future<List<Game>> getGames(String steamId) async {
    try {
      var url =
          Uri.encodeFull("${Urls.ownedGamesUri}$steamId${Urls.steamEndUrl}");

      final response = await dio.get(url);
      return SteamGamesModel.fromJson(response.data as Map<String, dynamic>)
          .response
          .games;
    } on Exception catch (e) {
      print(e.toString());
      return Future.error(e.toString());
    }
  }

  @override
  Future<Player> getPlayer(String steamId) async {
    try {
      var url =
          Uri.encodeFull("${Urls.baseUrlProfile}$steamId${Urls.steamEndUrl}");

      final response = await dio.get(url);
      return SteamPlayersModel.fromJson(response.data as Map<String, dynamic>)
          .players
          .first;
    } on Exception catch (e) {
      print(e.toString());
      return Future.error(e.toString());
    }
  }

  @override
  Future<List<Player>> getPlayers(String steamId) async {
    try {
      var url =
          Uri.encodeFull("${Urls.friendsBaseUrl}$steamId${Urls.steamEndUrl}");

      final response = await dio.get(url);
      return SteamPlayersModel.fromJson(response.data as Map<String, dynamic>)
          .players;
    } on Exception catch (e) {
      print(e.toString());
      return Future.error(e.toString());
    }
  }
}
