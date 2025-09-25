import 'package:flutter/material.dart';
import 'game_store_data.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final int index;
  DetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(20),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        toolbarHeight: 60,
        title: Text(
          gameList[index].name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(height: 20),
        Container(
          height: 200,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.9),
            itemCount: gameList[index].imageUrls.length,
            itemBuilder: (context, imageIndex) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(gameList[index].imageUrls[imageIndex]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(gameList[index].name, style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),),
              Text(gameList[index].price, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),),
              SizedBox(height: 5,),
              Text(gameList[index].about),
              SizedBox(height: 10,),
              Text("Recent Reviews : ${gameList[index].reviewAverage} (${gameList[index].reviewCount})", style: TextStyle(fontWeight: FontWeight.w700),),
              Text("Release Date : ${gameList[index].releaseDate}", style: TextStyle(fontWeight: FontWeight.w700),),
              SizedBox(height: 10,),
              Text("Popular Tags :", style: TextStyle(fontWeight: FontWeight.w700),),
                Wrap(
                alignment: WrapAlignment.start,
                spacing: 8.0,
                runSpacing: 2.0,
                children: gameList[index].tags.map((tag) => 
                Chip(
                  label: Text(tag, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blueAccent),),
                  backgroundColor: Colors.blue[100],
                  side: BorderSide.none,
                )
                ).toList(),
                ),
              
            ]
          ),
        ),
        Spacer(),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {
              launchUrl(Uri.parse(gameList[index].linkStore));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Center(
              child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Steam_2016_logo_black.svg/1920px-Steam_2016_logo_black.svg.png", width: 100,)),
          ),
        ),
        SizedBox(height: 5,)
        ],
      ),
    );
  }
}
