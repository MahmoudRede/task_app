
import 'package:dio/dio.dart';
import 'package:task_app/constants/constants.dart';

class DioHelper{

  static Dio ?dio;

  static init(){

    dio = Dio(
      BaseOptions(
          baseUrl:Constants.baseUrl,
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type':'application/Json'
          }
      ) ,
    );

  }

  static Future<Response> getDate({
    required String url,
    Map <String,dynamic> ?query
  })
  async{

    return await dio!.get(url,queryParameters: query) ;

  }

  static Future<Response> postDate({
    required String url,
    Map <String,dynamic> ?query,
    required Map<String,dynamic> data,
  })
  async{

    return await dio!.post(url,queryParameters: query,data: data) ;

  }

}