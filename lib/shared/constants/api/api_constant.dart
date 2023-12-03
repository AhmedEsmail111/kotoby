class ApiConstant {
  static const baseurl = 'https://kotobekia-backend.onrender.com/api';

  static const userCreateAccountUrl = '$baseurl/v1/auth/signUp';
  static const userLoginUrl = '$baseurl/v1/auth/logIn';
  static const verifyOtp = '$baseurl/v1/auth/verify-OTP';
  static const getHomePostMethodUrl = '/v1/levels/levels-posts';
  static const addNewPostUrlMethod = '/v1/posts';
}