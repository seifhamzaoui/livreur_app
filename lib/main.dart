import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'presentation/app.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await ScreenUtil.ensureScreenSize();
  runApp(const App());
}
