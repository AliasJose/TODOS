import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Model/model.dart';












class HomePage extends StatefulWidget {
  

 

  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

late Future<List<Album>>FutureAlbum;

  @override
  void initState() {
    super.initState();
    FutureAlbum = fetchAlbum();
   
  }
 Future<List<Album>>fetchAlbum()async{
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

  if(response.statusCode==200){
    print(response.body);
    print(response.statusCode.toString());
    List<dynamic>data=jsonDecode(response.body);
    List<Album>albums = data.map((albumJson) => Album.fromJson(albumJson)).toList();
    return albums;
  }
  else{
    throw Exception('failed to load');
  }
  }


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        
        title: Text("HomePage"),
      ),
      body: Center(

        child: FutureBuilder<List<Album>>(

              future: FutureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData){
                List<Album> albums= snapshot.data!;
                    return ListView.builder(
                      itemCount: albums.length,
                      itemBuilder: (context, index) {
                       Album album= albums[index];
                          return Card(
                          child:  Column(
                            children: [
                              Text(
                                                          album.userId.toString(),
                                                          style: TextStyle(
                                                            fontSize: 16.0,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                          Text(
                                                      album.id.toString(),
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),  
                                                     Text(
                                                      album.title,
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ), 
                                                     Text(
                                                      album.completed.toString(),
                                                      style: TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ), 
                            ],
                          ),
                                                                
                            
                          );

                      }
                      );

                } else{
                  throw Exception('Failed to fetch');
                }
                
                
              }
          
        ),
        )
      );
     }
}


