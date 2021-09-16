class ApiResult<T> {
  int? code;
  String? msg;
  T? result;

  ApiResult(this.code, this.msg);

  ApiResult.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    data['result'] = result;
    return data;
  }

  bool success() {
    return code != null && code == 200;
  }
}
