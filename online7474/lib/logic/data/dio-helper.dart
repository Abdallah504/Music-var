import 'package:dio/dio.dart';

abstract class DioHelper{
  Future<Response>postData({required String url ,  String? token, dynamic data});
  Future<Response>getData({required String url ,  String? token, dynamic data});
  Future<Response>putData({required String url ,  String? token, dynamic data});
  Future<Response>deleteData({required String url ,  String? token, dynamic data});
}

class DioImplementation extends DioHelper{
  Dio dio = Dio(
      BaseOptions(baseUrl: 'https://newsapi.org/v2/',
      receiveDataWhenStatusError: true,
        queryParameters: {},
        validateStatus: (statusCode){
        if(statusCode ==null){
          return false;
        }
        if(statusCode ==422){
          return true;
        }else{
          return statusCode >=200 && statusCode<300;
        }

        }
      )
  );

  @override
  Future<Response> deleteData({required String url, String? token, data}) async{
    dio.options.headers={

    };
    return await dio.delete(url!,queryParameters: {});
  }

  @override
  Future<Response> getData({required String url, String? token, data}) async{
    dio.options.headers={
      'Accept':'application/json'
    };
    return await dio.get(url!,queryParameters: {});
  }

  @override
  Future<Response> postData({required String url, String? token, data}) async{
    dio.options.headers={
      'Content-Type':'application/json',
      'Accept':'application/json'
    };
    return await dio.post(url!, data: data,queryParameters: {});
  }

  @override
  Future<Response> putData({required String url, String? token, data}) async{
    dio.options.headers={
      'Content-Type':'application/json',
      'Accept':'application/json'
    };
    return await dio.put(url!, data: data,queryParameters: {});
  }


}