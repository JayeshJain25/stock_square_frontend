import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsWebView extends StatefulWidget {
  final String newsUrl;

  const NewsWebView(this.newsUrl, {Key? key}) : super(key: key);

  @override
  _NewsWebViewState createState() => _NewsWebViewState();
}

class _NewsWebViewState extends State<NewsWebView> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: Text(
            "StockSquare",
            style: GoogleFonts.rubik(
              color: const Color(0xFF0892D0),
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          WebView(
            backgroundColor: Colors.transparent,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
            initialUrl: widget.newsUrl,
            javascriptMode: JavascriptMode.unrestricted,
          ),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            )
          else
            Stack(),
        ],
      ),
    );
  }
}
