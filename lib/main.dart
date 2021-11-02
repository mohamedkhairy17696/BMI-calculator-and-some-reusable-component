import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/bloc_observer.dart';
import 'package:new_project/modules/bmi_app/bmi/bmi_calculator.dart';
import 'package:new_project/shared/cubit/cubit.dart';
import 'package:new_project/shared/cubit/states.dart';
import 'package:new_project/shared/network/local/cache_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  bool isDark=CacheHelper.getBoolData(key: "isDark");
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (BuildContext context) => AppCubit()..changeThemeMode(fromShared: isDark),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              canvasColor: Color.fromRGBO(255, 254, 229, 1),
              scaffoldBackgroundColor: Color.fromRGBO(255, 254, 229, 1),
              appBarTheme: AppBarTheme(
                backgroundColor: Color.fromRGBO(255, 254, 229, 1),
                backwardsCompatibility: false,
                //made it false to control in status bar
                iconTheme: IconThemeData(color: Colors.black),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Color.fromRGBO(255, 254, 229, 1),
                  statusBarIconBrightness: Brightness.dark,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                elevation: 0.0,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20,
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Color.fromRGBO(110, 0, 0, 1.0),
              ),
              textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            darkTheme: ThemeData(
              canvasColor: Color.fromRGBO(14, 22, 33, 1.0),
              appBarTheme: AppBarTheme(
                backgroundColor: Color.fromRGBO(14, 22, 33, 1),
                backwardsCompatibility: false,
                //made it false to control in status bar
                iconTheme: IconThemeData(color: Colors.white),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Color.fromRGBO(14, 22, 33, 1),
                  statusBarIconBrightness: Brightness.light,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                elevation: 0.0,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20,
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Color.fromRGBO(110, 0, 0, 1.0),
              ),
              textTheme: ThemeData.dark().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            themeMode: AppCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            home:  BMICalculator(),
          );
        },
      ),
    );
  }
}
