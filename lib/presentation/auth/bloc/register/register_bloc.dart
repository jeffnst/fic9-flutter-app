import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ecommerce_app/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_ecommerce_app/data/models/requests/register_request_model.dart';
import 'package:flutter_ecommerce_app/data/models/responses/auth_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const _Initial()) {
    on<_Register>((event, emit) async {
      // TODO: implement event handler
      emit(const _Loading());
      final response = await AuthRemoteDatasource().register(event.data!);
      response.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
