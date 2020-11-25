import 'package:jagsa/src/repositories/itwitch_repo.dart';
import 'package:http/http.dart' as http;

class TwitchRepository implements ITwitchRepository {
  TwitchRepository({this.client});
  final http.Client client;
}
