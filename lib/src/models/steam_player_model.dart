class SteamPlayersModel {
  List<Player> players;

  SteamPlayersModel({this.players});

  SteamPlayersModel.fromJson(Map<String, dynamic> json) {
    if (json['players'] != null) {
      players = new List<Player>();
      json['players'].forEach((v) {
        players.add(new Player.fromJson(v));
      });
    }
  }
}

class Player {
  String steamid;
  int communityvisibilitystate;
  int profilestate;
  String personaname;
  int lastlogoff;
  String profileurl;
  String avatar;
  String avatarmedium;
  String avatarfull;
  int personastate;
  String primaryclanid;
  int timecreated;
  int personastateflags;
  String loccountrycode;
  String locstatecode;
  int loccityid;

  Player(
      {this.steamid,
      this.communityvisibilitystate,
      this.profilestate,
      this.personaname,
      this.lastlogoff,
      this.profileurl,
      this.avatar,
      this.avatarmedium,
      this.avatarfull,
      this.personastate,
      this.primaryclanid,
      this.timecreated,
      this.personastateflags,
      this.loccountrycode,
      this.locstatecode,
      this.loccityid});

  Player.fromJson(Map<String, dynamic> json) {
    steamid = json['steamid'];
    communityvisibilitystate = json['communityvisibilitystate'];
    profilestate = json['profilestate'];
    personaname = json['personaname'];
    lastlogoff = json['lastlogoff'];
    profileurl = json['profileurl'];
    avatar = json['avatar'];
    avatarmedium = json['avatarmedium'];
    avatarfull = json['avatarfull'];
    personastate = json['personastate'];
    primaryclanid = json['primaryclanid'];
    timecreated = json['timecreated'];
    personastateflags = json['personastateflags'];
    loccountrycode = json['loccountrycode'];
    locstatecode = json['locstatecode'];
    loccityid = json['loccityid'];
  }
}
