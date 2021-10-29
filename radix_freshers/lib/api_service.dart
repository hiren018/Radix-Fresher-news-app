import 'package:dio/dio.dart';
import 'package:radix_freshers/everythingdata.dart';
import 'package:radix_freshers/sourcedata.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';


@RestApi(baseUrl: 'https://newsapi.org/v2')
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl, String? category}) {
    dio.options = BaseOptions(
        receiveTimeout: 3000,
        connectTimeout: 3000,
        queryParameters: {
          'apikey': '4a937b0de2194f28814dabaae51b6411',
          'q': category ?? '',
        });
    return _ApiService(dio, baseUrl: baseUrl);
  }
  @GET('/top-headlines/sources')
  Future<Datum> getSources();

  @GET('/everything')
  Future<Album> getarticle();
}
