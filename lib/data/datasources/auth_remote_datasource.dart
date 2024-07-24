import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_ecommerce_app/data/models/requests/login_request_model.dart';
import 'package:flutter_ecommerce_app/data/models/responses/auth_response_model.dart';
import 'package:http/http.dart' as http;

import '../../common/constants/variables.dart';
import '../models/requests/register_request_model.dart';

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> register(
      RegisterRequestModel data) async {
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final response = await http.post(
        Uri.parse('${Variables.baseUrl}api/auth/local/register'),
        headers: headers,
        body: data.toJson());

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel data) async {
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}api/auth/local'),
      headers: headers,
      body: data.toJson(),
    );
    if (response.statusCode == 200) {
      return right(AuthResponseModel.fromJson(response.body));
    } else {
      /* final Map<String, dynamic> errorData = json.decode(response.body);
      final String errorMessage = errorData['error']['name'] ?? 'Unknown error';
      return left(errorMessage); */
      //return left(response.body);

      final errorResponse = response.body;
      final authError = AuthResponseModel.fromErrorJson(errorResponse);
      return left(authError);
    }
  }
}
