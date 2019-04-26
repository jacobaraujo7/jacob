import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBloc extends BlocBase{


  BehaviorSubject<bool> themeController = BehaviorSubject<bool>();
  Sink<bool> get themeIn => themeController.sink;
  Observable<bool> get themeOut => themeController.stream;
  SharedPreferences prefs;
  
  AppBloc(){
    initTheme();
  }
  initTheme() async {
    prefs = await SharedPreferences.getInstance();
    bool isDark = prefs.getBool('isDark') ?? false;
    themeIn.add(isDark);
  }

  changeTheme(bool isDark) async {
    if(prefs == null) return;
    await prefs.setBool('isDark', isDark);
    themeIn.add(isDark);
  }



  @override
  void dispose() {
    themeController.close();
  }

}