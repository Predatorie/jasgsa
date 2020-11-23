import 'package:jagsa/src/models/steam_games_model.dart';
import 'package:jagsa/src/models/steam_player_model.dart';

abstract class ISteamRepository {
  Future<Player> getPlayer(String steamId);
  Future<List<Player>> getPlayers(String steamId);
  Future<List<Game>> getGames(String steamId);
}
