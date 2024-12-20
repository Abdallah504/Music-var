import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart'as http;
import 'package:online7474/Models/bbc-model.dart';
import 'package:online7474/logic/data/dio-helper.dart';
import 'package:online7474/logic/data/endpints.dart';

part 'news_state.dart';


class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this.dioHelper) : super(NewsInitial());


  DioHelper dioHelper;
  String url = 'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=a081436a7034494a92c8920802ecd853';
  BbcModel? bbcModel;

  // Future<void>NewsData()async{
  //   emit(Loading());
  //   try{
  //     final response = await http.get(Uri.parse(url));
  //     if(response.statusCode ==200 ){
  //       final data = jsonDecode(response.body);
  //       bbcModel = BbcModel.fromJson(data);
  //       emit(DataReach());
  //     }
  //   }catch(e){
  //     print(e);
  //   }
  //   emit(DataReach());
  // }

  Future<void>NewsData()async{
    emit(Loading());
    try{
      await dioHelper.getData(url: bbc).then((v){
        if(v !=null){
          bbcModel = BbcModel.fromJson(v.data);
          emit(DataReach());
        }
      });
    }catch(e){
      print(e);
    }
    emit(DataReach());
  }
}
