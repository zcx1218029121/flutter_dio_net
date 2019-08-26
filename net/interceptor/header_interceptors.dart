import 'package:dio/dio.dart';
import 'package:zcx_open_hub/net/config/net_config.dart';

/// 请求头相关配置
/// creat by loafer
class HeaderInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) {
    ///设置超时时间
    options.connectTimeout = NetConfig.CONNECT_Timeout;

    /// 设置baseUrl
      if (NetConfig.BASE_URL != null) {
      options.baseUrl = NetConfig.BASE_URL;
    }

    return options;
  }
}
