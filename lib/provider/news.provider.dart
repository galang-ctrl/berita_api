import 'package:flutter/material.dart';
import 'package:info/helpers/api.dart';
import 'package:info/utils/const.dart';
import '../models/topNews.model.dart';

class NewsProvider with ChangeNotifier{
bool isLoading = true;
TopNewsModel? resNews;
getTopNews() async {
  //panggil API Get News
  final res = await api('${baseUrl}top-headlines?country=us&apiKey=$apiKey');

  if (res.statusCode == 200){
    resNews = TopNewsModel.fromJson(res.data);
  }else{
    resNews = TopNewsModel();
  }
  isLoading = false;
  notifyListeners();
}
}