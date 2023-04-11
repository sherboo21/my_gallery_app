import 'package:dio/dio.dart';
import 'app_services.dart';

class DioHelper {
  static late Dio dio;

  static init(){
    dio = Dio(
        BaseOptions(
            baseUrl: AppServices.baseUrl,
            receiveDataWhenStatusError: true
        )
    );
  }

  // Get Function //

  static Future<Response> getData({
    required String url,
    String? token,
    Map<String , dynamic>? params,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token',
    };
    return await dio.get(
        url,
        queryParameters: params
    );
  }

  // Post Function //

  static Future<Response> postData({
    required String url,
    String? token,
    Map<String , dynamic>? params,
    required dynamic body,
  }) async {
    return await dio.post(
        url,
        data: body,
        queryParameters: params,
        options: Options(
            followRedirects: false,
             // Will Not Throw Errors //
            validateStatus: (status) =>true,
            headers: {
              'Authorization': 'Bearer $token',
            }
        )
    );
  }
}