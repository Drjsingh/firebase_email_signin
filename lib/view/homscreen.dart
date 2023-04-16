import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:letmegrab/model/provider/datanotifier.dart';
import 'package:letmegrab/view/more_news_info.dart';
import 'package:provider/provider.dart';

import '../common/commonpopup.dart';
import '../logics/email_auth.dart';

class HomeScreen extends StatefulWidget {
  String emailId = '';
  HomeScreen(this.emailId);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchCtrl = TextEditingController();
  var data = [];

  Future<bool> _isBack() {
    return Popup().ExitAlert(context);
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<DataNotifier>();
    double containerWidth = MediaQuery.of(context).size.width;
    double containerHeight = MediaQuery.of(context).size.height;
    data = provider.data;
    return SafeArea(
      child: WillPopScope(
        onWillPop: _isBack,
        child: Scaffold(
          backgroundColor: Color(0xffFFFFFF),
          appBar: AppBar(
            backgroundColor: const Color(0xffc5c3c3),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                  onPressed: () async {
                    Popup().logOut(context);
                  },
                  icon: Icon(Icons.logout))
            ],
            title: Text(widget.emailId),
          ),
          body: Container(
            width: (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android)
                ? containerWidth
                : containerWidth / 2,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20,
                top: 20,
              ),
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        width: containerWidth - 40,
                        height: 50,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                        ),
                        child: TextField(
                          controller: searchCtrl,
                          onChanged: (val) {
                            if (val.isEmpty) {
                              provider.searchNews(val.toLowerCase());
                            }
                          },
                          decoration: InputDecoration(
                              prefixIcon: InkWell(
                                  onTap: provider.data_loading
                                      ? () => false
                                      : () {
                                          provider.searchNews(searchCtrl.text.toLowerCase());
                                        },
                                  child: Icon(
                                    Icons.search,
                                    color: provider.data_loading ? Color(0xffF6E7E4) : Color(0xff666666),
                                  )),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(width: 2, color: Color(0xff8FC046)),
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(width: 1, color: Color(0xff8FC046)),
                                borderRadius: BorderRadius.all((Radius.circular(10))),
                              ),
                              contentPadding: const EdgeInsets.only(top: 10),
                              hintText: "Category/Title Search"),
                        ),
                      ),
                      if (provider.data_loading) ...[
                        const CircularProgressIndicator()
                      ] else if (provider.data.length > 0) ...[
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                          ),
                          height: containerHeight - 190,
                          child: ListView.builder(
                            padding: EdgeInsets.only(top: 10),
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => WebViewNews(widget.emailId, data[index])),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  decoration: const BoxDecoration(
                                    color: Color(0x93EEEEEE),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        child: Image(
                                          image: NetworkImage(data[index]['imageUrl']),
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                          //  fit: BoxFit.fill,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 10.0, right: 10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                data[index]['title'].toString(),
                                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 10.0),
                                                child: Text(
                                                  data[index]['content'].toString(),
                                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                                                  maxLines: 2,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ] else ...[
                        const Center(child: Text("According to your search, No News Found"))
                      ]
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
