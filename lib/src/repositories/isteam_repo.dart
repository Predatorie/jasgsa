import 'package:jagsa/src/models/steam_games_model.dart';
import 'package:jagsa/src/models/steam_player_model.dart';

abstract class ISteamRepository {
  Future<ProfileDisplay> getUserProfileAsync(String steamId);
  Future<List<ProfileDisplay>> getFriendsProfileAsync(String steamId);
  Future<List<Game>> getGamesLibraryAsync(String steamId);
}
