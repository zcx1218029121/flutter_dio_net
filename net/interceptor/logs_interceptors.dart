
import 'package:dio/dio.dart';
import 'package:zcx_open_hub/net/config/net_config.dart';
/// login 拦截器 当[NetConfig.DEBUG]为true的时候对请求参数进行打印；
/// created by loafer
class LogsInterceptors extends InterceptorsWrapper{
  @override
  onRequest(RequestOptions options) {
    if (NetConfig.DEBUG) {
      print("请求url：${options.path}");
      print('请求头: ' + options.headers.toString());
      if (options.data != null) {
        print('请求参数: ' + options.data.toString());
      }
    }
  }
  @override
  onResponse(Response response) {
    if (NetConfig.DEBUG) {
      if (response != null) {
        print('返回参数: ' + response.toString());
      }
    }
    return response; // continue
  }

  @override
  onError(DioError err) {
    if (NetConfig.DEBUG) {
      print('请求异常: ' + err.toString());
      print('请求异常信息: ' + err.response?.toString() ?? "");
    }
    return err;
  }

}