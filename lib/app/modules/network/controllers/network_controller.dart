

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController{

  var connectionStatus = 0.obs;
  final Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> streamSubscription; 

  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    streamSubscription = connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }

  Future<void> initConnectivity()async{
    ConnectivityResult result;
    try{
      result = await connectivity.checkConnectivity();
      return updateConnectionStatus(result);
    }on PlatformException catch(e){
      print(e.toString());
    }
  }

  updateConnectionStatus(ConnectivityResult result){
    switch(result){
      case ConnectivityResult.wifi: connectionStatus.value = 1;break;
      case ConnectivityResult.none: connectionStatus.value = 0;break;
      case ConnectivityResult.mobile: connectionStatus.value = 2;break;
      default:  Get.snackbar("Network Error", "Failed to get network connection!");
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}