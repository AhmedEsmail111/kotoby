import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotobekia/modules/login/Login_screen.dart';
import 'package:kotobekia/modules/otp/otp_screen.dart';
import 'package:kotobekia/modules/verified_email/verified_email_screen.dart';
import 'package:kotobekia/shared/component/snakbar_message.dart';
import 'package:kotobekia/shared/constants/app/app_constant.dart';
import 'package:kotobekia/shared/constants/icons/icons_constant.dart';
import '../../controller/authentication/authentication_cubit.dart';
import '../../shared/component/authentication/button_authentication_services.dart';
import '../../shared/component/authentication/default_button_in_app.dart';
import '../../shared/component/authentication/default_text_form_in_app.dart';
import '../../shared/component/authentication/gender_row_in_auth.dart';
import '../../shared/component/authentication/row_text_and_link.dart';
import '../../shared/component/authentication/tow_line_and_text_in_auth.dart';
import '../../shared/styles/colors.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
    var dayController = TextEditingController();
    var monthController = TextEditingController();
    var yearController = TextEditingController();
    TextTheme font = Theme
        .of(context)
        .textTheme;
    double w = MediaQuery
        .sizeOf(context)
        .width;
    double h = MediaQuery
        .sizeOf(context)
        .height;
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is SuccessUserCreateAccountState) {
          if(state.userModel.token==null){
            snakBarMessage(
                context: context,
                message: state.userModel.message.toString());
          }else {
            Navigator.pushNamed(context, 'otp',arguments:emailController.text);
          }
        } else if (state is FailedUserCreateAccountState) {
          snakBarMessage(
              context: context,
              message: state.error);
        }
      },
      builder: (context, state) {
        var cubit = context.read<AuthenticationCubit>();
        return Directionality(
          textDirection: AppConstant.directionalityApp,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: h / 7.8, left: w / 25, right: w / 25),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Text(
                          'إنشاء حساب',
                          style: font.bodyLarge,
                        ),
                        SizedBox(
                          height: h / 55,
                        ),
                        Text(
                          'أنشئ حساب وابحث عن الخير او اصنع خير جديد ',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: h / 26,
                        ),
                        BuildButtonAuthServices(
                            onTap: () {},
                            text: 'التسجيل باستخدام حساب فيسبوك',
                            buttonColor: midGrayColor,
                            iconImage: IconConstant.facebookIcon,
                            elevation: 0,
                            context: context),
                        SizedBox(
                          height: h / 55,
                        ),
                        BuildButtonAuthServices(
                            onTap: () {},
                            text: 'التسجيل باستخدام حساب جوجل',
                            buttonColor: midGrayColor,
                            iconImage: IconConstant.googleIcon,
                            elevation: 0,
                            context: context),
                        SizedBox(
                          height: h / 35,
                        ),
                        BuildTowLineRowInAuth(context: context),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BuildDefaultTextField(
                                backGroundColor: Colors.white,
                                maxLenght: 100,
                                controller: nameController,
                                width: double.infinity,
                                height: h / 16.8,
                                withText: true,
                                onValidate: (value) {
                                  if (value!.isEmpty) {
                                    return 'الرجاء إدخال اسمك.';
                                  }
                                  return null;
                                },
                                isObscured: false,
                                inputType: TextInputType.name,
                                hintText: 'احمد محمد عبدالعال',
                                aboveFieldText: 'الاسم بالكامل',
                                context: context),
                            SizedBox(
                              height: h / 52,
                            ),
                            BuildDefaultTextField(
                                backGroundColor: Colors.white,
                                maxLenght: 320,
                                controller: emailController,
                                width: double.infinity,
                                height: h / 16.8,
                                withText: true,
                                isObscured: false,
                                onValidate: (value) {
                                  if (value!.isEmpty) {
                                    return "الرجاء إدخال البريد الإلكتروني.";
                                  } else if (!RegExp(
                                      r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
                                      .hasMatch(value)) {
                                    return "البريد الإلكتروني غير صالح. يرجى إدخال عنوان بريد إلكتروني صحيح.";
                                  }
                                  return null;
                                },
                                inputType: TextInputType.emailAddress,
                                hintText: 'Ahmed@gmail.com',
                                aboveFieldText: 'البريد الالكتروني',
                                context: context),
                            SizedBox(
                              height: h / 52,
                            ),
                            BuildDefaultTextField(
                                cubit: cubit,
                                backGroundColor: Colors.white,
                                maxLenght: 128,
                                controller: passwordController,
                                width: double.infinity,
                                height: h / 16.8,
                                withText: true,
                                onValidate: (value) {
                                  if (value!.isEmpty) {
                                    return "الرجاء إدخال كلمة المرور.";
                                  } else if (value.length < 6) {
                                    return "يجب أن تكون كلمة المرور على الأقل 6 أحرف.";
                                  }
                                  return null;
                                },
                                inputType: TextInputType.text,
                                hintText: '*****************',
                                numberOfFormPass: 1,
                                isObscured: true,
                                aboveFieldText: 'الرقم السري',
                                context: context),
                            SizedBox(
                              height: h / 52,
                            ),
                            BuildDefaultTextField(
                                cubit: cubit,
                                backGroundColor: Colors.white,
                                maxLenght: 128,
                                width: double.infinity,
                                height: h / 16.8,
                                withText: true,
                                numberOfFormPass: 2,
                                onValidate: (value) {
                                  if (value!.isEmpty) {
                                    return "الرجاء إدخال تأكيد كلمة المرور.";
                                  } else if (value.length < 6) {
                                    return "يجب أن تكون كلمة المرور على الأقل 6 أحرف.";
                                  } else if (passwordController.text !=
                                      confirmPasswordController.text) {
                                    return "كلمة المرور وتأكيد كلمة المرور غير متطابقين.";
                                  }
                                  return null;
                                },
                                controller: confirmPasswordController,
                                inputType: TextInputType.text,
                                hintText: '*****************',
                                isObscured: true,
                                aboveFieldText: 'أعد كتابة الرقم السري',
                                context: context),
                            SizedBox(
                              height: h / 52,
                            ),
                            Text(
                              'الجنس',
                              style: font.titleMedium!.copyWith(
                                fontSize:
                                MediaQuery
                                    .of(context)
                                    .size
                                    .width / 25.5,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                BuildGenderRow(
                                    genderValue: cubit.genderValue,
                                    onChange: (gender) {
                                      cubit.changeGender(0);
                                    },
                                    context: context,
                                    text: 'ذكر',
                                    character: gender.Male),
                                SizedBox(
                                  width: w / 20,
                                ),
                                BuildGenderRow(
                                    genderValue: cubit.genderValue,
                                    onChange: (gender) {
                                      cubit.changeGender(1);
                                    },
                                    context: context,
                                    text: 'أنثى',
                                    character: gender.Female)
                              ],
                            ),
                            SizedBox(
                              height: h / 52,
                            ),
                            Text(
                              'تاريخ الميلاد',
                              style: font.titleMedium!.copyWith(
                                fontSize:
                                MediaQuery
                                    .of(context)
                                    .size
                                    .width / 25.5,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BuildDefaultTextField(
                                    backGroundColor: Colors.white,
                                    maxLenght: 2,
                                    inputType: TextInputType.number,
                                    withText: false,
                                    controller: dayController,
                                    onValidate: (value) {
                                      if (value!.isEmpty) {
                                        return 'فارغ';
                                      }
                                      return null;
                                    },
                                    hintText: 'يوم',
                                    aboveFieldText: '',
                                    context: context,
                                    width: w / 5.5,
                                    height: h / 17.5,
                                    isObscured: false),
                                BuildDefaultTextField(
                                    backGroundColor: Colors.white,
                                    maxLenght: 2,
                                    inputType: TextInputType.number,
                                    withText: false,
                                    hintText: 'شهر',
                                    controller: monthController,
                                    onValidate: (value) {
                                      if (value!.isEmpty) {
                                        return 'فارغ';
                                      }
                                      return null;
                                    },
                                    aboveFieldText: '',
                                    context: context,
                                    width: w / 5.5,
                                    height: h / 17.5,
                                    isObscured: false),
                                BuildDefaultTextField(
                                    backGroundColor: Colors.white,
                                    inputType: TextInputType.number,
                                    withText: false,
                                    maxLenght: 4,
                                    hintText: 'سنة',
                                    controller: yearController,
                                    onValidate: (value) {
                                      if (value!.isEmpty) {
                                        return 'فارغ';
                                      }
                                      return null;
                                    },
                                    aboveFieldText: '',
                                    context: context,
                                    width: w / 2.4,
                                    height: h / 17.5,
                                    isObscured: false),
                              ],
                            ),
                            SizedBox(
                              height: h / 28,
                            ),
                            state is! LoadingUserCreateAccountState
                                ? BuildDefaultButton(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    String birthDate = '${yearController.text}-${monthController.text}-${dayController.text}';
                                    cubit.userCreateAccount(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        name: nameController.text,
                                        birthDate: birthDate,
                                        gender: cubit.genderValue == gender.Male
                                            ? 'male'
                                            : 'female');
                                  }
                                },
                                text: 'إنشاء حساب',
                                color: primaryColor,
                                elevation: 4,
                                context: context)
                                : const Center(
                                child: CircularProgressIndicator(
                                    color: primaryColor)),
                            SizedBox(
                              height: h / 30,
                            ),
                            BuildRowTextAndLink(
                                fontSize: w / 30,
                                onTap: () {
                                  Navigator.pushNamed(context, 'login');
                                },
                                text: 'لديك حساب؟',
                                textLink: 'تسجيل الدخول',
                                context: context),
                            SizedBox(
                              height: h / 15,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}