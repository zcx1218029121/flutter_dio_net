class Code {
  ///网络错误
  static const NETWORK_ERROR = -1;

  ///网络超时
  static const NETWORK_TIMEOUT = -2;

  ///网络返回数据格式化错误
  static const NETWORK_JSON_EXCEPTION = -3;

  static const SUCCESS = 200;

  static errorHandleFunction(code, message, noTip) {
    /// 如果需要eventBus取消下面注释 把错误信息交给eventBus
    /*
    eventBus.fire(new HttpErrorEvent(code, message));
    return message;*/
    if(noTip) {
      return message;
    }
  }
}