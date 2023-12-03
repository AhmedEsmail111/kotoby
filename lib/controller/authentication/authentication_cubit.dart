// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotobekia/shared/constants/api/api_constant.dart';
import 'package:kotobekia/shared/constants/app/app_constant.dart';
import 'package:kotobekia/shared/network/local/local.dart';

import '../../models/user_model/user_model.dart';
import '../../shared/component/authentication/gender_row_in_auth.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  UserModel? userModel;
  ErrorUserModel? errorUserModel;
  final dio = Dio();
  static AuthenticationCubit get(context) => BlocProvider.of(context);

  void userCreateAccount({
    required String email,
    required String password,
    required String name,
    required String gender,
    required String birthDate,
  }) async {
    emit(LoadingUserCreateAccountState());

    try {
      final Response response = await dio.post(
        ApiConstant.userCreateAccountUrl,
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
      final Response response = await dio.post(ApiConstant.userLoginUrl,
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

  Locale locale =
      Locale(CacheHelper.getData(key: AppConstant.languageKey) ?? 'ar');

  void changeDefaultLanguage(String languageCode) async {
    locale = Locale(languageCode);
    if (languageCode == 'en' &&
        CacheHelper.getData(key: AppConstant.languageKey) != 'en') {
      await CacheHelper.saveData(key: AppConstant.languageKey, value: 'en');

      emit(ChangeDefaultLanguageAuthenticationState());
      return;
    }
    if (languageCode == 'ar' &&
        CacheHelper.getData(key: AppConstant.languageKey) != 'ar') {
      await CacheHelper.saveData(key: AppConstant.languageKey, value: 'ar');

      emit(ChangeDefaultLanguageAuthenticationState());
      return;
    }
  }

  int? index;

  void changeLanguage(bool check) async {
    if (check == false) {
      index = 0;
      changeDefaultLanguage('en');
    } else {
      index = 1;
      changeDefaultLanguage('ar');
    }
    emit(SuccessChangeCheckLanguageState());
  }
}