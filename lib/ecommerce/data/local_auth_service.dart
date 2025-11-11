
import 'package:shared_preferences/shared_preferences.dart';

class LocalAuthService {
 static const String userCredentialKey = 'usercredential';
static late  SharedPreferences prefs;
void initAuthService() async {
  prefs = await SharedPreferences.getInstance();
}
Future<void> loginUser(String email) async {
  prefs.setString(userCredentialKey, email);
}
Future<void> signupUser(String email) async {
  prefs.setString(userCredentialKey, email);
}
}
