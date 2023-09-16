import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiPath {
  static const String baseUrl = "https://testapp-1aop.onrender.com/";
  static const String login = "Auth/login";
  static const String register = "Auth/register";
}

class DioHelper {
  Dio dio = Dio();

  Future<Response> getData({required String endPoint}) async {
    Response response = await dio.get(
      ApiPath.baseUrl + endPoint,
    );
    log(response.statusCode.toString());
    return response;
  }

  Future<Response> postData({
    bool handleError = true,
    required String endPoint,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    try {
      Response response = await dio.post(
        ApiPath.baseUrl + endPoint,
        data: body,
         options: Options(
          headers: {
            "Authorization": "Token $token",
          },
        ),
      );
      if (kDebugMode) {
        print(response.data);
      }
      if (response.statusCode == 204 ||
          response.statusCode == 200 ||
          response.statusCode == 201) {
      } else if (response.statusCode == 403) {
        if (kDebugMode) {
          print(response.data);
        }
      }
      return response;
    } on DioError catch (error) {
      rethrow;
    }
  }

  Future<Response> putData({
    required String endPoint,
    Map<String, dynamic>? body,
  }) async {
    return await dio.put(
      ApiPath.baseUrl + endPoint,
      data: body,
    );
  }
}
