import 'dart:convert';

import 'package:authentication/Repository/Api/Api_Client.dart';
import 'package:authentication/Repository/ModelClass/LoginModel.dart';
import 'package:authentication/Repository/ModelClass/SignUpModel.dart';
import 'package:http/http.dart';

class UserApi {
  ApiClient apiClient = ApiClient();
//Siginup
  Future<SignUpModel> GetSignUp(
      String name, String email, String state, String password,String City,String locality ) async {
    String trendingpath = 'http://45.159.221.50:9890/api/signup';

    var body ={
      "fullName": name,
      "email":email,
      "state":state,
      "city":City,
      "locality":locality,
      "password":password
    };
    print("welcome" + body.toString());
    Response response =
    await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return SignUpModel.fromJson(jsonDecode(response.body));
  }


  //Siginup
  Future<LoginModel> GetLogin(
      String email, String password) async {
    String trendingpath = 'http://45.159.221.50:9890/api/signin';

    var body ={
      "email":email,
      "password":password
    };
    print("welcome" + body.toString());
    Response response =
    await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return LoginModel.fromJson(jsonDecode(response.body));
  }

}