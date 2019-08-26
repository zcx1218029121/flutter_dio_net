# flutter_dio_net
flutter网络请求的简单封装

### 1. 需要添加的依赖
```yml
shared_preferences: ^0.5.3+2
connectivity: ^0.4.3+2
dio: ^2.1.3
```
### 2 .如何使用
#### 1. 发起一个post请求
```dart
login(String username, String passWord) async {
    HashMap<String, String> params = new HashMap();
    params["userName"] = "短狐";
    params["password"] ="1234567";
    var res = await httpManager.post(Domain.login, params,null , new Options());
  }
```
#### 2. 如何发起一个get请求
```dart
  login(String username, String passWord) async {
    HashMap<String, String> params = new HashMap();
    params["userName"] = "短狐";
    params["password"] ="1234567";
    var res = await httpManager.get(Domain.login, params,null , new Options());
  }
```

#### 3. 相关配置
```dart
  class NetConfig {
  ///  /// ////////////////////////////// DIO 配置 ////////////////////////////////////// ///
  static const DEBUG = true;
  static const int CONNECT_Timeout = 15000;
  static const int RECEIVE_Timeout = 15000;
  /// [RequestOptions] BASE_URL 如果 BASE_URL 就添加
  static const String BASE_URL = "YOUR BASE_URL";

  /// ///////////////////////////////// 常量   ////////////////////////////////// ///
  static const TOKEN_KEY = "token";
  static const USER_NAME_KEY = "user-name";
  static const PW_KEY = "user-pw";
  static const USER_BASIC_CODE = "user-basic-code";
  static const USER_INFO = "user-info";
  static const LANGUAGE_SELECT = "language-select";
  static const LANGUAGE_SELECT_NAME = "language-select-name";
  static const REFRESH_LANGUAGE = "refreshLanguageApp";
  static const THEME_COLOR = "theme-color";
  static const LOCALE = "locale";
}
```
 *DEBUG=flase 时不显示打印日志*
 
 *static const String BASE_URL = "YOUR BASE_URL" 为null的时候不配置*
 
 *static const int CONNECT_Timeout = 15000;* CONNECT_Timeout 时间
 
 *static const int RECEIVE_Timeout = 15000;* RECEIVE_Timeout 时间
 
 
