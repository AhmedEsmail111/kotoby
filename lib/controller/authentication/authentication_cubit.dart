// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:kotobekia/models/identity_user_model/identity_user_model.dart';
import 'package:kotobekia/shared/constants/api/api_constant.dart';
import 'package:kotobekia/shared/network/remote/remote.dart';

import '../../models/user_model/user_model.dart';
import '../../shared/component/authentication/gender_row_in_auth.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  UserModel? userModel;

  void userCreateAccount({
    required String email,
    required String password,
    required String name,
    required String gender,
    required String birthDate,
  }) async {
    emit(LoadingUserCreateAccountState());

    try {
      final Response response = await DioHelper.postData(
        url: ApiConstant.userCreateAccountUrl,
        data: {
          'fullName': name,
          'email': email,
          'password': password,
          'gender': gender,
          'birthDate': birthDate,
        },
      );

      print(response.data.toString());
      Map<String, dynamic> responseData = response.data;
      userModel = UserModel.fromJson(responseData);
      emit(SuccessUserCreateAccountState(userModel!));
    } catch (error) {
      if (error is DioError) {
        Map<String, dynamic> responseData = error.response!.data;
        userModel = UserModel.fromJson(responseData);
        print(error.response!.data.toString());
        emit(SuccessUserCreateAccountState(userModel!));
      } else {
        print(error.toString());
        emit(FailedUserCreateAccountState('there is Error'));
      }
    }
  }

  void userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoadingUserLoginState());

    try {
      final Response response = await DioHelper.postData(
          url: ApiConstant.userLoginUrl,
          data: {'email': email, 'password': password});

      print(response.data.toString());
      Map<String, dynamic> responseData = response.data;
      userModel = UserModel.fromJson(responseData);
      emit(SuccessUserLoginState(userModel!));
    } catch (error) {
      if (error is DioError) {
        Map<String, dynamic> responseData = error.response!.data;
        userModel = UserModel.fromJson(responseData);
        print(error.response!.data.toString());
        emit(SuccessUserLoginState(userModel!));
      } else {
        print(error.toString());
        emit(FailedUserLoginState('there is Error'));
      }
    }
  }

  bool isObscureOne = true;
  bool isObscureTwo = true;

  void changeVisiabilityPassword(int n) {
    if (n == 1) {
      isObscureOne = !isObscureOne;
    } else {
      isObscureTwo = !isObscureTwo;
    }

    emit(SuccessChangeVisibilityPasswordState());
  }

  gender genderValue = gender.Male;

  void changeGender(int value) {
    if (value == 0) {
      genderValue = gender.Male;
    } else {
      genderValue = gender.Female;
    }
    emit(SuccessChangeGenderState());
  }
}
