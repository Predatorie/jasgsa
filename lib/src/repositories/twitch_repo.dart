import 'package:dio/dio.dart';
import 'package:jagsa/src/repositories/itwitch_repo.dart';

class TwitchRepository implements ITwitchRepository {
  TwitchRepository({this.dio});
  final Dio dio;
}
