import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counting_state.dart';

class CountingCubit extends Cubit<CountingState> {
  CountingCubit() : super(CountingInitial());

  int xyz = 0;

  increment(){
    xyz ++;
    emit(Increase());
  }

  decrement(){
    if(xyz != 0){
      xyz --;
     emit(Decrease());
    }else{

    }
    emit(Decrease());
  }

}
