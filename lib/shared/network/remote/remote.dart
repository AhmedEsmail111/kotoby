
import 'package:dio/dio.dart';

import '../../constants/api/api_constant.dart';

class DioHelper{
  static Dio ?dio;
  static init(){
    dio=Dio(
        BaseOptions(
          baseUrl: ApiConstant.baseurl,
          receiveDataWhenStatusError: true,
        )
    );
  }
  static Future<Response> getData({
    required url,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      if (token != null) 'token': token,
    };
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required url,
    required Map<String,dynamic> data,
    String lang='en',
    String ?token
  }) async{
    dio!.options.headers={
      'Content-Type':'application/json',
      'lang':lang,
      if (token != null) 'Authorization': token,
    };
    return await dio!.post(url,data: data);
  }


  static Future<Response> putData({
    required url,
    required Map<String,dynamic> data,
    String lang='en',
    String ?token
  }) async{
    dio!.options.headers={
      'Content-Type':'application/json',
      'lang':lang,
      if (token != null) 'Authorization': token,
    };
    return await dio!.put(url,data: data);
  }
}