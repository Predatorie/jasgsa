import 'package:flutter/material.dart';
import 'package:jagsa/src/models/result_model.dart';
import 'package:jagsa/src/models/steam_games_model.dart';
import 'package:jagsa/src/models/steam_player_model.dart';

abstract class ISteamRepository {
  Future<Result<ProfileDisplay>> getUserProfileAsync(
      {@required String steamId});
  Future<Result<List<ProfileDisplay>>> getFriendsProfileAsync(
      {@required String steamId});
  Future<Result<List<Game>>> getGamesLibraryAsync({@required String steamId});
}
