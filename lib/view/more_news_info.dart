import 'package:flutter/material.dart';
import 'package:letmegrab/common/commonpopup.dart';

class WebViewNews extends StatefulWidget {
  String emailId = '';
  var moreNewsInfo;
  WebViewNews(this.emailId, this.moreNewsInfo);

  @override
  State<WebViewNews> createState() => _WebViewNewsState();
}

class _WebViewNewsState extends State<WebViewNews> {
  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width;
    double containerHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffc5c3c3),
            actions: [
              IconButton(
                  onPressed: () async {
                    Popup().logOut(context);
                  },
                  icon: Icon(Icons.logout))
            ],
            title: Text(widget.emailId),
          ),
          body: mobileView(containerHeight)),
    );
  }

  mobileView(double containerHeight) {
    return SingleChildScrollView(
      child: Container(
        height: containerHeight,
        child: Column(
          children: [
            Container(
              height: containerHeight / 2.5,
              child: Image(
                image: NetworkImage(widget.moreNewsInfo['imageUrl'].toString()),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 5, left: 20, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.moreNewsInfo['title'].toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Text(
                            "Author-${widget.moreNewsInfo['author'].toString()}",
                            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Color(0xff666666)),
                          ),
                          Spacer(),
                          Text(
                            widget.moreNewsInfo['date'].toString() + " " + widget.moreNewsInfo['time'].toString(),
                            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Color(0xff666666)),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        widget.moreNewsInfo['content'].toString(),
                        style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: Color(0xff666666)),
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
  }

  webView(double containerHeight) {
    return SingleChildScrollView(
      child: Container(
        height: containerHeight,
        child: Column(
          children: [
            Container(
              height: containerHeight / 2.5,
              child: Image(
                image: NetworkImage(widget.moreNewsInfo['imageUrl'].toString()),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 5, left: 20, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.moreNewsInfo['title'].toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Text(
                            "Author-${widget.moreNewsInfo['author'].toString()}",
                            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Color(0xff666666)),
                          ),
                          Spacer(),
                          Text(
                            widget.moreNewsInfo['date'].toString() + " " + widget.moreNewsInfo['time'].toString(),
                            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Color(0xff666666)),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        widget.moreNewsInfo['content'].toString(),
                        style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: Color(0xff666666)),
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
  }
}
