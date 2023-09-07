import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:user_info_module/injection_container.dart' as di;
import 'app.dart';
import 'modules/user_details/data/data_sources/local/user_local_data_source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Hive.initFlutter();
  await UserLocalDataSource().initialize();
  runApp(const MyApp());
}
