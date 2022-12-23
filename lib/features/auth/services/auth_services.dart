
import 'package:amazon_clone/common/utils.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

import '../../../common/error_handling.dart';
import '../../../constants/global_variables.dart';

class AuthService {
  void signupUser({
    required BuildContext context,
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      User user = User(
          name: name,
          id: '',
          email: email,
          password: password,
          address: '',
          type: '',
          token: '');

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String,String> {
          'Content-type': 'application.json; charset=UTF=8'
        } 
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Account Created! Login with the same credentials!');
        }
      );

    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
