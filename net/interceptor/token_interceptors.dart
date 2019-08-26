import 'package:zcx_open_hub/net/config/net_config.dart';
import 'package:dio/dio.dart';
import 'package:zcx_open_hub/net/local/local_storage.dart';

/// token 拦截器
/// Created by loafer
class TokenInterceptors extends InterceptorsWrapper {
  /// [_token] token string
  String _token;

  /// [callBack] 如果token 为空的回调
  /// [options] dio 对象 配置请求头等
  @override
  onRequest(RequestOptions options, {Function callBack}) async {
    var authorizationCode;
    if (_token == null) {
      if (callBack != null) {
        await getAuthorization(callBack: callBack);
      } else {
        authorizationCode = await getAuthorization();
      }

      if (authorizationCode != null) {
        _token = authorizationCode;
      }
    }
    options.headers["Authorization"] = _token;
    return options;
  }

  ///清除授权
  clearAuthorization() {
   this._token = null;
   LocalStorage.remove(NetConfig.TOKEN_KEY);
  }

  ///[callBack] 当 token 不存在时的回调
  /// 从缓存中获取 token
  getAuthorization({Function() callBack}) async {
    String token = await LocalStorage.get(NetConfig.TOKEN_KEY);
    if (token == null) {
      if (callBack != null) {
        callBack();
      }
    } else {
      this._token = token;
      return token;
    }
  }

  @override
  onResponse(Response response) async {
    try {
      var responseJson = response.data;
      if (response.statusCode == 201 && responseJson["token"] != null) {
        _token = 'token ' + responseJson["token"];
        await LocalStorage.save(NetConfig.TOKEN_KEY, _token);
      }
    } catch (e) {
      print(e);
    }
    return response;
  }
}
