import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_user/app/common/theme.dart';
import 'package:random_user/app/modules/network/bindings/network_binding.dart';
import 'package:random_user/app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Application',
      initialRoute: AppPages.MOVIES_SCREEN,
      getPages: AppPages.routes,
      theme: Themes.light,
      darkTheme: Themes.dark,
      debugShowCheckedModeBanner: false,
      initialBinding: NetworkBinding(),
    )
  );
}