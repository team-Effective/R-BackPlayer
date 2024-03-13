import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLogic {
  static const String keyUserID = 'userID';


  //端末にuser_idを保存する
  Future<void> saveUserID(String userID) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(keyUserID, userID);
  }

  //端末からuser_idを取得する
  Future<String?> getUserID() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(keyUserID);
  }
}
