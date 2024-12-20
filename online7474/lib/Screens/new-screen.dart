import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {

    Map<String,dynamic>musics={
      'photo':[
        'https://m.media-amazon.com/images/M/MV5BNTc4ODVkMmMtZWY3NS00OWI4LWE1YmYtN2NkNDA3ZjcyNTkxXkEyXkFqcGc@._V1_.jpg',
        'https://images.genius.com/c898e599a46c771ab91a5cb6705975c5.500x500x1.jpg',
        'https://i1.sndcdn.com/artworks-9u0d63VOCQugHjBv-ZyYAxQ-t500x500.jpg',
        'https://upload.wikimedia.org/wikipedia/en/e/ea/Skilletcomatose.jpg'
      ],
      'songName':[
        'Hello',
        'Bleeding',
        'Ehna eldonya',
        'Comatose'
      ],
      'artist':['Adele','Talkin toys','Tamer Ashour','Skillet']
    };
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment:CrossAxisAlignment.center ,
                children: [
                  Text('Discover', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),),
                  Icon(Icons.search,size: 20,)
                ],
              ),
              SizedBox(height: 20,),
              Container(
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: musics['photo'].length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index){
                      return Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            height: 200,
                            width: 220,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black)
                            ),
                            child: Padding(
                              padding:  EdgeInsets.all(2.0),
                              child: Image.network(musics['photo'][index].toString(),fit: BoxFit.fill,),
                            ),
                          ),
                          Positioned(
                              right: 30,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.white,
                                    child: Center(
                                      child: Icon(Icons.play_circle,color: Colors.black,),
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Container(
                                      height: 40,
                                      width: 140,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade400,
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.play_arrow,color: Colors.white,),
                                            SizedBox(width: 10,),
                                            Text('|',style: TextStyle(color: Colors.white,fontSize: 15),),
                                            SizedBox(width: 10,),
                                            Icon(Icons.download,color: Colors.white,),
                                            SizedBox(width: 10,),
                                            Text('|',style: TextStyle(color: Colors.white,fontSize: 15),),
                                            SizedBox(width: 10,),
                                            Icon(Icons.favorite_border,color: Colors.white,),
                                          ],
                                        ),
                                      )
                                  ),
                                ],
                              )),
                          Positioned(
                              bottom: 50,
                              right: 140,
                              child: Column(
                                children: [
                                  Text(musics['songName'][index].toString(),style: TextStyle(fontWeight: FontWeight.bold,
                                  color: Colors.blue
                                  ),),
                                  Text(musics['artist'][index].toString(),style: TextStyle(fontWeight: FontWeight.normal,
                                      color: Colors.blue
                                  ),)
                                ],
                              ))
                        ],
                      );
                    }),
              ),
              SizedBox(height: 50,),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: musics['photo'].length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context,index){
                    return ListTile(
                      leading: Image.network(musics['photo'][index].toString()),
                      title: Text(musics['songName'][index].toString()),
                      subtitle: Text(musics['artist'][index].toString()),
                      trailing: Text('...',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                    );
                  })
            ],
          ),
        ),
      )
    );
  }
}