import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jagsa/secrets/secrets.dart';
import 'package:jagsa/src/exceptions/network_exception.dart';
import 'package:jagsa/src/models/result_model.dart';
import 'package:jagsa/src/models/steam_games_model.dart';
import 'package:jagsa/src/models/steam_player_model.dart';
import 'package:jagsa/src/repositories/isteam_repo.dart';
import 'package:jagsa/src/services/formatting_service.dart';

class SteamRepository implements ISteamRepository {
  final http.Client client;
  final FormattingService formatterService;

  SteamRepository({@required this.formatterService, @required this.client});

  @override
  Future<Result<List<ProfileDisplay>>> getFriendsProfileAsync(
      {@required String steamId}) async {
    // get a list of friends
    var url = "${Urls.friendsBaseUrl}$steamId${Urls.steamEndUrl}";

    var result = await client
        .get(Uri.encodeFull(url))
        .then((result) => result.body)
        .then(json.decode)
        .then((f) => Players.fromJson(f))
        .catchError((err) => throw NetworkException(err.toString()));

    if (result.players == null || result.players.length == 0) {
      return Result<List<ProfileDisplay>>(
        value: null,
        isFailure: true,
        isSuccess: false,
        errorMessage:
            'Unable to retrieve friends profiles list. List might not be public.',
      );
    }

    var players = result.players;
    var friends = List<ProfileDisplay>();

    // iterate over friends to get their profile
    for (var player in players) {
      var profile = await getUserProfileAsync(steamId: player.steamid);
      if (profile.isSuccess) {
        friends.add(profile.value);
      }
    }

    friends
        .sort((a, b) => b.lastLogOffTimeStamp.compareTo(a.lastLogOffTimeStamp));

    return Result<List<ProfileDisplay>>(
      value: friends,
      isSuccess: true,
    );
  }

  @override
  Future<Result<List<Game>>> getGamesLibraryAsync(
      {@required String steamId}) async {
    var url = "${Urls.ownedGamesUri}$steamId${Urls.steamEndUrl}";

    List<Game> list = [];

    var result = await client
        .get(Uri.encodeFull(url))
        .then((result) => result.body)
        .then(json.decode)
        .then((json) => json["response"])
        .then((games) => SteamGames.fromJson(games))
        .catchError((err) {
      return Result<List<Game>>(
        value: null,
        isSuccess: false,
        isFailure: true,
        errorMessage: '$err',
      );
    });

    var library = result.library;
    if (library == null || library.games?.length == 0) {
      // Likely the user does not have a public profile or we lost connection
      return Result<List<Game>>(
        value: null,
        isSuccess: false,
        isFailure: true,
        errorMessage:
            'Unable to retrieve games library. Profile might not be public',
      );
    }

    // Sort games my most time played
    library.games
        .sort((a, b) => b.playtimeForever.compareTo(a.playtimeForever));

    for (var game in library.games) {
      // videos, sdks might not have an image so filter those
      if (game.imgLogoUrl == null ||
          game.imgLogoUrl.isEmpty ||
          game.imgIconUrl == null ||
          game.imgIconUrl.isEmpty) {
        continue;
      }

      var thisGame = Game(
          id: game.appid,
          name: game.name,
          imgIconUrl: formatterService.buildImageLogo(
              game.appid.toString(), game.imgIconUrl),
          imgLogoUrl: formatterService.buildImageLogo(
              game.appid.toString(), game.imgLogoUrl),
          playtimeForever:
              formatterService.totalPlayTimeToString(game.playtimeForever));

      list.add(thisGame);
    }

    return Result<List<Game>>(
      value: list,
      isSuccess: true,
    );
  }

  @override
  Future<Result<ProfileDisplay>> getUserProfileAsync(
      {@required String steamId}) async {
    var url = "${Urls.baseUrlProfile}$steamId${Urls.steamEndUrl}";

    var result = await client
        .get(Uri.encodeFull(url))
        .then((result) => result.body)
        .then(json.decode)
        .then((json) => json["response"])
        .then((profile) => Players.fromJson(profile))
        .catchError((err) {
      return Result<ProfileDisplay>(
        value: null,
        isSuccess: false,
        isFailure: true,
        errorMessage: '$err',
      );
    });

    if (result.players?.length == 0) {
      return Result<ProfileDisplay>(
        value: null,
        isSuccess: false,
        isFailure: true,
        errorMessage: 'Unable to retrieve steam profile.\nPlease try again.',
      );
    }

    var display = ProfileDisplay(id: result.players[0].steamid)
      ..avatar = result.players[0].avatar
      ..avatarmedium = result.players[0].avatarmedium
      ..avatarfull = result.players[0].avatarfull
      ..communityvisibilitystate =
          result.players[0].communityvisibilitystate.toString()
      ..lastlogoff =
          formatterService.lastLogToString(result.players[0].lastlogoff)
      ..lastLogOffTimeStamp = result.players[0].lastlogoff
      ..loccountrycode = result.players[0].loccountrycode
      ..locstatecode = result.players[0].locstatecode
      ..personaname = result.players[0].personaname
      ..personastate =
          formatterService.personaStateToText(result.players[0].personastate)
      ..personastateflags = result.players[0].personastateflags.toString();

    return Result<ProfileDisplay>(
      value: display,
      isSuccess: true,
    );
  }
}
