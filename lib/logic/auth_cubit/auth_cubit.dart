import 'dart:developer';

import 'package:auth_app_with_api/logic/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();
  void register({
    required String userName,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(RegisterLoadingState());
    try {
      final response =
          await dioHelper.postData(endPoint: ApiPath.register, body: {
        "username": userName,
        "email": email,
        "password": password,
        "phone": phone,
      });
      emit(RegisterSuccessState());
      log("${response.data}");
      log("${response.data['newuser']['email']}");
    } catch (e) {
      emit(RegisterErrorState());
      log("$e");
    }
  }

  void login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      final response = await dioHelper.postData(
        endPoint: ApiPath.login,
        body: {
          "email": email,
          "password": password,
        },
      );
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError());
    }
  }
}
