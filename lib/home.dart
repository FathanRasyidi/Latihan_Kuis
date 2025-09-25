import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page/detail.dart';
import 'package:login_page/login.dart';
import 'game_store_data.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(20),
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        toolbarHeight: 80,
        title: Row(
          children: [
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang, $username!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    'Praktikum Mobile SI-A',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (Route<dynamic> route) => false);
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.logout, size: 16, color: Colors.red.shade600),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:  8.0, vertical: 10),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      mainAxisExtent: 220),
                    itemBuilder: (context, index) {
                      return _gameStore(context, index);
                    },
                    itemCount: gameList.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _gameStore(BuildContext context, int index){
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(index: index)));
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(gameList[index].imageUrls[0]),
            SizedBox(height: 10,),
            Text(gameList[index].name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
            Row(
              children: [
                Text("👍 " + gameList[index].reviewAverage, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 12),),
                Text(" | " + gameList[index].releaseDate, style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 12),),
              ],
            ),
            SizedBox(height: 8),
            Text(gameList[index].price, style: TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
