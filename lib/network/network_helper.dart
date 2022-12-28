import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NetworkHelper{
  static final NetworkHelper instance=NetworkHelper._init();
  NetworkHelper._init();

   Dio dio=Dio();
 Future< Response> GET({required String?path,
 Map<String,dynamic>?queryParameters,
   Options? options,
   CancelToken?cancelToken,
   Function(int,int)?onReceiveProgress
 })async{
   Response?response;
     try{
       Response response=await dio.get(path??'',
           queryParameters: queryParameters,
           options: options,
           cancelToken: cancelToken,
           onReceiveProgress: onReceiveProgress);

     }on DioError catch (error){
       print('Error :${error.error} - ${error.stackTrace} - ${error.message}');
     }catch(error){
       print('Another Error $error');
     }
     return response!;
   }
}