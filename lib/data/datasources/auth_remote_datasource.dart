import 'package:dartz/dartz.dart';
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
}
