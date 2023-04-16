import 'package:flutter/material.dart';
import 'package:letmegrab/model/api/api_service.dart';

class DataNotifier extends ChangeNotifier {
  final List<Map<String, dynamic>> _data = [];
  final List<String> categorie = ['all', 'science', 'business', 'sports'];
  List searchValue = [];
  bool _data_loading = false;
  DataNotifier() {
    getNewsDetails('');
  }

  get data => _data; //getter for getting data on page

  //implemented setter getter for loading, till data is fetching
  get data_loading => _data_loading;
  set data_loading(val) {
    _data_loading = val;
    notifyListeners();
  }

  searchNews(searchKey) {
    getNewsDetails(searchKey);
  }

  Future<dynamic> getNewsDetails(searchKey) async {
    data_loading = true;
    _data.clear();
    for (int i = 0; i < categorie.length; i++) {
      print(categorie[i]);
      var news_response = await ApiService().fetchNewsData(categorie[i]); //fetch data from given url

      if (news_response['success'] == true) {
        var api_data = news_response['data'];
        api_data.forEach((value) {
          if (news_response['category'].contains(searchKey) || value['title'].toLowerCase().contains(searchKey)) {
            _data.add({
              "author": value['author'].toString(),
              "content": value['content'].toString(),
              "title": value['title'].toString(),
              "date": value['date'],
              "time": value['time'],
              "id": value['id'].toString(),
              "imageUrl": value['imageUrl'].toString(),
              "readMoreUrl": value['readMoreUrl'].toString(),
              "url": value['url'].toString(),
            });
          }
        });
      }
    }

    print("daata-------------------${data}");
    data_loading = false;
    notifyListeners();
  }
}
