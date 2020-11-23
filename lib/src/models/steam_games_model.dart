import 'package:flutter/material.dart';

class SteamGamesModel {
  SteamResponse response;

  SteamGamesModel({this.response});

  SteamGamesModel.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? new SteamResponse.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response.toJson();
    }
    return data;
  }
}

class SteamResponse {
  int gameCount;
  List<Game> games;

  SteamResponse({this.gameCount, this.games});

  SteamResponse.fromJson(Map<String, dynamic> json) {
    gameCount = json['game_count'];
    if (json['games'] != null) {
      games = new List<Game>();
      json['games'].forEach((v) {
        games.add(new Game.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['game_count'] = this.gameCount;
    if (this.games != null) {
      data['games'] = this.games.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Game {
  int appid;
  String name;
  int playtimeForever;
  String imgIconUrl;
  String imgLogoUrl;
  bool hasCommunityVisibleStats;

  Game(
      {@required this.appid,
      this.name,
      this.playtimeForever,
      this.imgIconUrl,
      this.imgLogoUrl,
      this.hasCommunityVisibleStats});

  Game.fromJson(Map<String, dynamic> json) {
    appid = json['appid'];
    name = json['name'];
    playtimeForever = json['playtime_forever'];
    imgIconUrl = json['img_icon_url'];
    imgLogoUrl = json['img_logo_url'];
    hasCommunityVisibleStats = json['has_community_visible_stats'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appid'] = this.appid;
    data['name'] = this.name;
    data['playtime_forever'] = this.playtimeForever;
    data['img_icon_url'] = this.imgIconUrl;
    data['img_logo_url'] = this.imgLogoUrl;
    data['has_community_visible_stats'] = this.hasCommunityVisibleStats;
    return data;
  }
}
