import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class LoginAuthCall {
  static Future<ApiCallResponse> call({
    String username = '',
    String passwd = '',
    String format = 'json',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'loginAuth',
      apiUrl: 'http://127.0.0.1:8000/api/app/login',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'username': username,
        'passwd': passwd,
        'format': format,
      },
      returnBody: true,
    );
  }
}

class GetDoctorsCall {
  static Future<ApiCallResponse> call({
    String id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getDoctors',
      apiUrl: 'http://127.0.0.1:8000/api/msos/doctors',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': id,
      },
      returnBody: true,
    );
  }

  static dynamic names(dynamic response) => getJsonField(
        response,
        r'''..name''',
      );
}

class GetChemistsCall {
  static Future<ApiCallResponse> call({
    String id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getChemists',
      apiUrl: 'http://127.0.0.1:8000/api/msos/chemists',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': id,
      },
      returnBody: true,
    );
  }

  static dynamic name(dynamic response) => getJsonField(
        response,
        r'''..name''',
      );
}

class GetARCsCall {
  static Future<ApiCallResponse> call({
    String id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getARCs',
      apiUrl: 'http://127.0.0.1:8000/api/msos/arcs',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': id,
      },
      returnBody: true,
    );
  }

  static dynamic arcs(dynamic response) => getJsonField(
        response,
        r'''..name''',
      );
}

class GetStockistsCall {
  static Future<ApiCallResponse> call({
    String id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getStockists',
      apiUrl: 'http://127.0.0.1:8000/api/msos/stockists',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': id,
      },
      returnBody: true,
    );
  }

  static dynamic names(dynamic response) => getJsonField(
        response,
        r'''..name''',
      );
}

class GetSamplesCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getSamples',
      apiUrl: 'http://127.0.0.1:8000/api/samples',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static dynamic names(dynamic response) => getJsonField(
        response,
        r'''..name''',
      );
}

class GetPOPsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getPOPs',
      apiUrl: 'http://127.0.0.1:8000/api/pops',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static dynamic names(dynamic response) => getJsonField(
        response,
        r'''..name''',
      );
}

class GetProductsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getProducts',
      apiUrl: 'http://127.0.0.1:8000/api/products',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static dynamic names(dynamic response) => getJsonField(
        response,
        r'''$[0:]name''',
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$[0:]pk''',
      );
  static dynamic type(dynamic response) => getJsonField(
        response,
        r'''$[0:]type''',
      );
  static dynamic size(dynamic response) => getJsonField(
        response,
        r'''$[0:]size''',
      );
}
