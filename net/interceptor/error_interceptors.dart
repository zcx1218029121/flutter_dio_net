import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:zcx_open_hub/net/code.dart';
import 'package:zcx_open_hub/net/result_data.dart';
class ErrorInterceptors extends InterceptorsWrapper {
  final Dio _dio;

  ErrorInterceptors(this._dio);
  /// 网络连通性检查
  @override
  onRequest(RequestOptions options) async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return _dio.resolve(new ResultData(Code.errorHandleFunction(Code.NETWORK_ERROR, "", false), false, Code.NETWORK_ERROR));
    }
    return options;
  }
}