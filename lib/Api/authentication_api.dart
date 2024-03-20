import 'package:flutter_api/helpers/http.dart';
import 'package:flutter_api/helpers/http_response.dart';
import 'package:flutter_api/models/authentication_response.dart';

//'http://192.168.1.9:9000',
class AuthenticationAPI {
  final Http _http;

  AuthenticationAPI(this._http);

  Future<HttpResponse<AuthenticationResponse>> register({
    required String username,
    required String email,
    required String password,
  }) {
    return _http.request<AuthenticationResponse>(
      '/api/v1/register',
      method: 'POST',
      data: {
        "username": username,
        "email": email,
        "password": password,
      },
      parser: (data) {
        return AuthenticationResponse.fromJson(data);
      },
    );
  }

  Future<HttpResponse<AuthenticationResponse>> login({
    required String email,
    required String password,
  }) {
    return _http.request<AuthenticationResponse>(
      '/api/v1/login',
      method: 'POST',
      data: {
        "email": email,
        "password": password,
      },
      parser: (data) {
        return AuthenticationResponse.fromJson(data);
      },
    );
  }

  Future<HttpResponse<AuthenticationResponse>> refreshToken({
    required String expiredToken,
  }) {
    return _http.request<AuthenticationResponse>(
      '/api/v1/refresh-token',
      method: 'POST',
      headers: {
        "token": expiredToken,
      },
      parser: (data) {
        return AuthenticationResponse.fromJson(data);
      },
    );
  }
}
