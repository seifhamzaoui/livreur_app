import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'welcome_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('fr', 'FR'),
              Locale('ar', 'AE'),
            ],
            locale: Locale('fr', ''),
            theme: ThemeData(
              fontFamily: 'Montserrat',
              textTheme: TextTheme(
                button: TextStyle(fontSize: 14.sp),
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: WelcomeScreen(), //
          );
        });
  }
}
