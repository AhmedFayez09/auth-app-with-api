import 'dart:developer';

import 'package:auth_app_with_api/logic/data/all_users_model.dart';
import 'package:auth_app_with_api/logic/data/profile_model.dart';
import 'package:auth_app_with_api/logic/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  ProfileModel profileModel = ProfileModel();
  void getProfileData({
    required String uId,
    required String token,
  }) async {
    emit(GetProfileLoading());
    try {
      final response = await dioHelper.getData(
        endPoint: ApiPath.getProfile(uId: uId),
        token: token,
      );
      profileModel = ProfileModel.fromJson(response.data);
      log("${response.data}");
      emit(GetProfileSuccess());
    } catch (err) {
      log("$err");
      emit(GetProfileError());
    }
  }
AllUsersModel allUsersModel = AllUsersModel();
  void getAllUsers({required String token}) async {
    emit(GetAllUserLoading());
    try {
      final response = await dioHelper.getData(
        endPoint: ApiPath.getAlluser,
        token: token,
      );
      allUsersModel = AllUsersModel.fromJson(response.data);
      emit(GetAllUserSuccess());
    } catch (err) {
      emit(GetAllUserError());
    }
  }
}
