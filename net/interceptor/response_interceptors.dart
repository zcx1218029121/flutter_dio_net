import 'package:dio/dio.dart';
import 'package:zcx_open_hub/http/common/result_data.dart';
import 'package:zcx_open_hub/net/code.dart';

/// 返回拦截器把返回值统一封装成[ResultData]
/// created by loafer
class ResponseInterceptors extends InterceptorsWrapper {

  @override
  onResponse(Response response) {
    RequestOptions option = response.request;
    try {
      if (option.contentType != null && option.contentType.primaryType == "text") {
        return new ResultData(response.data, true, Code.SUCCESS);
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        return new ResultData(response.data, true, Code.SUCCESS, headers: response.headers);
      }
    } catch (e) {
      print(e.toString() + option.path);
      return new ResultData(response.data, false, response.statusCode, headers: response.headers);
    }
  }

}
