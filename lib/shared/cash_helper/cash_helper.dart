import 'package:hive_flutter/adapters.dart';

class CashServices {
  // init hive
  static Future<void> init() async {
    await Hive.initFlutter();
    print('********************************************');
    print('hive initialized successfully ');
    print('********************************************');
  }

  static Future<void> openBox({required String box}) async {
    await Hive.openBox(box);
    print('********************************************');
    print('box Opend successfully ');
    print('********************************************');
  }
}
