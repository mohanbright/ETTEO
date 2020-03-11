import 'package:dio/dio.dart';
import 'package:etteo_demo/api/base_api.dart';
import 'package:etteo_demo/helpers/app_config.dart';
import 'package:etteo_demo/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:etteo_demo/providers/providers.dart';
import 'dart:io';

class AuthenticationApi extends BaseApi{
  final String authBaseUrl = AppConfig().appSettings.get(AppSetting.stsAuthority) ;

  Future<Map> authenticate({@required String username, @required String password}) async{
    String url =  appendSlashIfNotExists(url: authBaseUrl, relativePath: 'connect/token');
    Response response;
    try{
      response =await dio().post(
        url,
        options: Options(
          contentType: ContentType.parse("application/x-www-form-urlencoded"),
        ),
               
        data: {
          'grant_type': 'password',
          'client_id': AppConfig().appSettings.get(AppSetting.clientId),
          'client_secret': AppConfig().clientSecret,
          'username': username,
          'password': password,
        }
      );
      print("response.dataaaaaa_MyDaTa:${response.data}");
      return response.data;
      
    }catch(e){
      print("ERROR:$e");
      throw e;
    }
  }

  Future<Map> renewToken({@required AuthenticationToken authToken}) async{
    Response response ;
    try{
     String url = appendSlashIfNotExists(url: authBaseUrl, relativePath: 'connect/token');

     response = await dio().post(
       url,
       options: Options(
          contentType: ContentType.parse("application/x-www-form-urlencoded"),
       ),
       data:  {
        'grant_type': 'refresh_token',
          'client_id': AppConfig().appSettings.get(AppSetting.clientId),
          'client_secret': AppConfig().clientSecret,
          'access_token': '' + authToken.getAccessToken(),
          'refresh_token': '' + authToken.getRefreshToken()
        }
     );
     return response.data;
    }catch(e){
      throw e;
    }

  }
}