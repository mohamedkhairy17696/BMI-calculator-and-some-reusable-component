import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/shared/cubit/states.dart';
import 'package:new_project/shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);
  bool isDark=false;

  void changeThemeMode({bool fromShared}){
    if(fromShared!=null){
      isDark=fromShared;
      emit(ChangeAppModeState());
    }else{
      isDark=!isDark;
      CacheHelper.sharedPreferences.setBool("isDark", isDark).then((value) {
        emit(ChangeAppModeState());
      });
    }
  }
}
