import 'package:hive_flutter/adapters.dart';

class CashServices {
  // init hive
  static Future<void> init() async {
    await Hive.initFlutter();
    print('********************************************');
    print('hive initialized successfully ');
    print('********************************************');
  }

  static Future<void> openBox<T>({required String box}) async {
    await Hive.openBox<T>(box);
    print('********************************************');
    print('box Opend successfully ');
    print('********************************************');
  }

  static void registerAdapter(dynamic model) {
    Hive.registerAdapter(model);
  }

  static List<T> get<T>({
    required String boxName,
  }) {
    var myBox = Hive.box<T>(boxName);
    return myBox.values.toList();
  }

  static Future<int> add<T>({
    required T value,
    required String boxName,
  }) async {
    var myBox = Hive.box<T>(boxName);
    return await myBox.add(value);
  }
}
