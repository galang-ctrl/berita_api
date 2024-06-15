import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:info/components/news.dart';
import 'package:info/provider/news.provider.dart';
import 'package:info/screens/data_tampil.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key}) ;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  getNews(){
    Provider.of<NewsProvider>(context, listen: false).getTopNews();
  }
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getNews();
     }
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (BuildContext context, news, Widget? child) {
        return RefreshIndicator(
          onRefresh: () async {
            return await getNews();
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text('Berita Terbaru',
              style:  TextStyle(
                  fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.lightBlue,
              ),
              ),
              actions: [
              IconButton(onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=> DataTampil())
                );
              },
                  icon:  const  Icon(Icons.file_copy_outlined)),
              IconButton(onPressed: () {
                FirebaseAuth.instance.signOut();
          },
                  icon: const  Icon(Icons.logout)),
            ],

            ),
            body:  SingleChildScrollView(
              child: Padding(
                padding:const  EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                  news.isLoading
                      ? Center(
                      child: CircularProgressIndicator(),
                  )
                  :Column(
                    children: [
                      ...news.resNews!.articles!.map(
                          (e)=>  News(
                            title: e.title ?? '',
                            image: e.urlToImage ?? '',
                          )
                      )
                    ],
                  ),
                  ],
                ),
              )),
          ),
        );
      }
    );
  }
}
