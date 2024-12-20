import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online7474/logic/news/news_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    final news = context.read<NewsCubit>();
    return BlocConsumer<NewsCubit,NewsState>(builder: (context,state){

      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('BBC News',style: TextStyle(color: Colors.white),),
          centerTitle: true,
        ),

        body:state is DataReach && news.bbcModel !=null? ListView.builder(
            itemCount: news.bbcModel!.articles!.length,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context,index){
              return Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  onTap: ()async{
                    if (!await launchUrl(Uri.parse(news.bbcModel!.articles![index].url.toString()))) {
                    throw Exception('Could not launch ');
                    }
                  },
                  leading: Image.network(news.bbcModel!.articles![index].urlToImage.toString()),
                  title: Text((news.bbcModel!.articles![index].title.toString()), style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle:Text((news.bbcModel!.articles![index].publishedAt.toString())) ,
                ),
              );
            }): Center(child: CircularProgressIndicator(color: Colors.red,),),
      );
    }, listener: (context,state){});
  }
}
