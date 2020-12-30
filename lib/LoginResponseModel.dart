class LoginResponseModel{
  int _result;
  String _message;
  LoginResponseModel(this._result, this._message);

  String get message => _message;

  int get result => _result;

  set message(String value) {
    _message = value;
  }

  set result(int value) {
    _result = value;
  }
}
