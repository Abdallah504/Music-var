
import 'package:flutter/material.dart';

class MainAppProvider extends ChangeNotifier{
  int result = 0;

  increment(){
    result ++;
    notifyListeners();
  }

  decrement(){
    if(result != 0){
      result --;
      notifyListeners();
    }else{

    }
    notifyListeners();
  }


}