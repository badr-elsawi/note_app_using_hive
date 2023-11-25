import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/cubits/app_cubit/app_cubit.dart';
import 'package:note_app/cubits/app_cubit/app_states.dart';
import 'package:note_app/cubits/note-Cubit/notes_cubit.dart';
import 'package:note_app/layout/home.dart';
import 'package:note_app/shared/cash_helper/cash_helper.dart';
import 'package:note_app/shared/constants.dart';
import 'package:note_app/shared/styles/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashServices.init();
  await CashServices.openBox(box: noteBox);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => AppCubit()),
        BlocProvider(create: (BuildContext context) => NotesCubit()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Notie',
                theme: lightTheme,
                home: Home(),
              );
            },
          );
        },
      ),
    );
  }
}
