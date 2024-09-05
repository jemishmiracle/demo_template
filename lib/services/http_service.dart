import 'dart:convert';
import 'package:demo_template/constants/constants.dart';
import 'package:demo_template/localization/app_strings.dart';
import 'package:dio/dio.dart';
import 'package:demo_template/utils/app_urls.dart';
import 'package:demo_template/utils/hive_store_util.dart';
import 'package:demo_template/utils/utils.dart';

/// HttpService class contains 4 main http request get,put,post,delete
/// in this class we have used interceptors, using those we can handle errors for all http requests.
/// Usage :
///   HttpService httpService = HttpService();
///   httpService.getRequest("url");

class HttpService {
  late Dio _dio;

  HttpService(){
    init();
  }

// http get request
  Future getRequest(String url,{rowData = const {},bool useAuthorization = true,bool showLoading = false,closeLoading = false,}) async{
    _dio.options.headers['content-Type'] = 'application/json';
    if(useAuthorization) {
      _dio.options.headers['Authorization'] = "${HiveStoreUtil.getString(HiveStoreUtil.accessTokenKey)}";
    }
    if(showLoading) Utils.showLoading();
    Response response;
    try {
      printLog("headers ${_dio.options.headers}" );
      printLog("url " + url);
      response = await _dio.get(url).catchError((e) => throw Exception(e));
      printLog("response.get ${response.data}");
      if(closeLoading) Utils.closeLoading();
    } catch (e) {
      printLog(e.toString());
      if(closeLoading) Utils.closeLoading();
      throw Exception(e);
    }

    return response;
  }

// http post request
  Future postRequest(String url,{rowData = const {},bool useAuthorization = true,bool showLoading = false,closeLoading = false,}) async{
    _dio.options.headers['content-Type'] = 'application/json';
    if(useAuthorization) {
      _dio.options.headers['Authorization'] = "${HiveStoreUtil.getString(HiveStoreUtil.accessTokenKey)}";
    }
    if(showLoading) Utils.showLoading();
    Response response;

    try {
      if(rowData is FormData){
        _dio.options.headers['Content-Type'] = "multipart/form-data";
        printLog("fields ${rowData.fields}");
        printLog("files ${rowData.files}");
      } else {
        printLog(jsonEncode(rowData));
      }
      printLog("headers ${_dio.options.headers}" );
      printLog("url ${url}");
      response = await _dio.post(url,data: rowData).catchError((e) => throw Exception(e));
      printLog("response.post ${response.data}");
      if(closeLoading) Utils.closeLoading();
    } catch (e) {
      if(closeLoading) Utils.closeLoading();
      printErrorLog(e.toString());
      throw Exception(e);
    }

    return response;
  }

// http patch request
  Future patchRequest(String url,{rowData = const {}}) async{
    _dio.options.headers['content-Type'] = 'application/json';
    Response response;
    try {
      printLog("headers ${_dio.options.headers}" );
      printLog("rowData.patch ${jsonEncode(rowData)}" );
      printLog("url $url");
      response = await _dio.patch(url,data: rowData);
      printLog("response.patch ${response.data}");
    } catch (e) {
      printLog(e.toString());
      throw Exception(e);
    }
    return response;
  }

  // http put request
  Future putRequest(String url,{rowData = const {},bool useAuthorization = true,bool showLoading = false,closeLoading = false,}) async{
    _dio.options.headers['content-Type'] = 'application/json';
    if(useAuthorization) {
      _dio.options.headers['Authorization'] = "${HiveStoreUtil.getString(HiveStoreUtil.accessTokenKey)}";
    }
    if(showLoading) Utils.showLoading();
    Response response;

    try {
      printLog("headers ${_dio.options.headers}" );
      printLog("url ${url}");
      response = await _dio.put(url,data: rowData).catchError((e) => throw Exception(e));
      printLog("response.put ${response.data}");
      if(closeLoading) Utils.closeLoading();
    } catch (e) {
      if(closeLoading) Utils.closeLoading();
      printErrorLog(e.toString());
      throw Exception(e);
    }

    return response;
  }

// http delete request
  Future deleteRequest(String url) async{
    _dio.options.headers['content-Type'] = 'application/json';
    Response response;
    try {
      printLog("headers ${_dio.options.headers}");
      printLog("url $url");
      response = await _dio.delete(url);
      printLog(response.toString());
    } catch (e) {
      printLog(e.toString());
      throw Exception(e);
    }

    return response;
  }

  initializeInterceptors(){
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        handler.next(options);
      },
      onResponse: (e, handler) {
        handler.next(e);
      },
      onError: (e, handler) async {
        printLog("statusCode ${e.response?.statusCode.toString()}");
        printLog("error ${e.response?.data.toString()}");
        switch (e.response?.statusCode) {
          case 400: //Bad Request
            String msg = e.response?.data['message'] ??"";
            Utils.showToast(msg.isNotEmpty ? msg : AppStrings.something_wrong);
            break;
          case 401: // Not Authorized
            String msg = e.response?.data['message'] ??"";
            Utils.showToast(msg.isNotEmpty ? msg :  AppStrings.something_wrong);
            break;
          case 404: // Not Found
            String msg = e.response?.data['message'] ??"";
            Utils.showToast(msg.isNotEmpty ? msg :  AppStrings.something_wrong);
            break;
          case 500: //Internal Server Error
            String msg = e.response?.data['message'] ??"";
            Utils.showToast(msg.isNotEmpty ? msg :  AppStrings.something_wrong);
            break;
          case 501: //Internal Server Error
            String msg = e.response?.data['message'] ??"";
            Utils.showToast(msg.isNotEmpty ? msg :  AppStrings.something_wrong);
            break;

          default:
            Utils.showToast(AppStrings.something_wrong);
            break;
        }
        handler.next(e);
      },
    ));
  }

  void init() {
    _dio = Dio(BaseOptions(
        baseUrl: AppUrls.base_url,
        followRedirects: false,
        connectTimeout: Duration(minutes: 1), // 60 seconds
        receiveTimeout: Duration(minutes: 1)
    ));
    initializeInterceptors();
  }
}