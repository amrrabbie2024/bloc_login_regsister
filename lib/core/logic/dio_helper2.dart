
import 'package:dio/dio.dart';
import 'package:flutter_login_regsister/core/logic/constants.dart';

class DioHelper2{

  static final _dio=Dio(
      BaseOptions(
          baseUrl: Constants.Movies_Base_Url,
          headers: {

          }
      )
  );

  static Future<CustomResponse> send(String path,{Map<String,dynamic>? data}) async {
    print("Post  ${Constants.Movies_Base_Url}$path");
    print("data $data");
    try {
      final response = await _dio.post(path, data: data);
      print(response.data);
      return CustomResponse(isSucess: true,data: response.data,statusCode: response.statusCode);
    }on DioException catch (ex){
      print(ex.response?.data);
      return CustomResponse(isSucess: false,data: ex.response?.data,statusCode: ex.response?.statusCode,
          // msg: ex.error.toString()
          msg: ex.response?.data["status_message"]
      );
    }
  }

  static Future<CustomResponse> get(String path,{Map<String,dynamic>? data}) async {
    print("Get  ${Constants.Movies_Base_Url}$path");
    print("data $data");

    try {
      final response = await _dio.get(path, queryParameters: data);
      print(response.data);
      return CustomResponse(
          isSucess: true, data: response.data, statusCode: response.statusCode);
    }on DioException catch(ex){
      print(ex.response?.data);
      return CustomResponse(isSucess: false,data: ex.response?.data,statusCode: ex.response?.statusCode,
          //msg: ex.error.toString()
          msg: ex.response?.data["status_message"]
      );
    }
  }

}

class CustomResponse{
  final String msg;
  final int? statusCode;
  final bool isSucess;
  final data;

  CustomResponse({ this.msg="", this.statusCode,required this.isSucess, this.data});
}