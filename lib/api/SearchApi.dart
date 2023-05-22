import 'dart:convert';

import 'package:http/http.dart';
import 'package:testasd/api/ApiClient.dart';
import 'package:testasd/model/SearchModel.dart';


class SearchApi {
  ApiClient apiClient = ApiClient();
  Future<SearchModel> getSearch() async {
    print("search doctor Api working");
    String basePath = "?key=36637221-a38d7850c8c6b6e12e4e3ac3d&q=yellow+flowers&image_type=photo";

    Response response =
        await apiClient.invokeApi(path: basePath, method: "GET", body: null);
    print(response.body);
    return SearchModel.fromJson(json.decode(response.body));
  }
}
