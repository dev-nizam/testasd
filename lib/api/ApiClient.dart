import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

import 'package:testasd/api/ApiException.dart';


class ApiClient {
  static const String basePath = "https://pixabay.com/api/";
  Future<Response> invokeApi(
      {required String path,
        required String method,
        required Object? body}) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // print(prefs.getString('token'));
    Map<String, String> headerparams = {};
    if (method == "POST" ||
        method == "GET" ||
        method == "DELETE" ||
        method == "PATCH") {
      headerparams ={
        'Cookie': '__cf_bm=Q5NrRwh_m8uIaGym2wB2JatWDlMULAen23r2fCji7Z4-1684736819-0-AX2wA/sKFuC0bhe/PKVK72qj3IQq+vSZv4gmOSuJa+6Hsx5e4YTGFv96Br9cnHNBcad6dhMD1wS5xoP5KafXJbI=; anonymous_user_id=None; csrftoken=gRmcJZVPVxciYok2dzqnwkIPHLMqC1oNh3YSmLNqnPXLKZfQMJ031PDM4hFKvYtw; dwf_strict_media_search=False'
      };
    }

    Response response;

    String url = basePath + path;
    print(url);

    final nullableHeaderParams = (headerparams.isEmpty) ? null : headerparams;

    switch (method) {
      case "POST":
        response =
        await post(Uri.parse(url), headers: headerparams, body: body);
        break;
      case "PUT":
        response = await put(Uri.parse(url),
            headers: {
              'content-Type': 'application/json',
            },
            body: body);
        break;
      case "DELETE":
        response = await delete(Uri.parse(url),
            headers: nullableHeaderParams, body: body);
        break;
      case "POST_":
        response = await post(
          Uri.parse(url),
          headers: {},
          body: body,
        );
        break;
      case "GET_":
        response = await post(
          Uri.parse(url),
          headers: {},
          body: body,
        );
        break;
      default:
        response = await get(Uri.parse(url), headers: headerparams);
    }
    print('status of $path =>' + (response.statusCode).toString());
    print(response.body);
    if (response.statusCode >= 400) {
      log(path +
          ' : ' +
          response.statusCode.toString() +
          ' : ' +
          response.body);

      throw ApiException(
          message: _decodeBodyBytes(response), statusCode: response.statusCode);
    }
    return response;
  }

  String _decodeBodyBytes(Response response) {
    var contentType = response.headers["content-type"];
    if (contentType != null && contentType.contains("application/json")) {
      return jsonDecode(response.body)['message'];
    } else {
      return response.body;
    }
  }
}
