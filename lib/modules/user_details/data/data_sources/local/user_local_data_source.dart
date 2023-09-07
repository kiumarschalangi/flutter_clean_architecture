import 'package:hive/hive.dart';

class UserLocalDataSource {
  late Box<dynamic> _box;

  Future<void> initialize() async {
    _box = await Hive.openBox('storage');
  }

  String? get userName => _box.get('userName') as String?;
  Future<void> setUserName(final String userName) async {
    await _box.put('userName', userName);
  }

  String? get email => _box.get('email') as String?;
  Future<void> setEmail(final String email) async {
    await _box.put('email', email);
  }

  Future<void> eraseUserInfo() async {
    await _box.delete('userName');
    await _box.delete('email');
  }
}
