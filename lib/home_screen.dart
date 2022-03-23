import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stock_square_app/news_web_view.dart';

import 'news_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false).getNewsFeed();
  }

  double getDescriptionLength(int lengthOfDesc) {
    if (lengthOfDesc > 100) {
      return 7;
    } else {
      return 0;
    }
  }

  String convertToAgo(String input) {
    final DateTime time1 = DateTime.parse("$input Z");
    final Duration diff = DateTime.now().difference(time1);

    if (diff.inDays == 1) {
      return '${diff.inDays} day ago';
    } else if (diff.inDays > 1) {
      return '${diff.inDays} days ago';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} hrs ago';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} mins ago';
    } else if (diff.inSeconds >= 1) {
      return '${diff.inSeconds} secs ago';
    } else {
      return 'just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          backgroundColor: Colors.white,
          title: Text(
            "Stock Square News",
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Consumer<NewsProvider>(
            builder: (ctx, model, _) => model.newsCompleteList.isEmpty
                ? Center(
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://firebasestorage.googleapis.com/v0/b/cryptox-aabf8.appspot.com/o/animation_500_kvhmucnx.gif?alt=media&token=8321a796-0c25-433b-ae46-b1db4467a32e',
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                  )
                : ListView.builder(
                    itemCount: model.newsCompleteList.length,
                    itemBuilder: (ctx, index) {
                      return InkWell(
                        onTap: () {
                          print(model.newsCompleteList[index].url);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => NewsWebView(
                                  model.newsCompleteList[index].url)));
                        },
                        child: Container(
                          margin: EdgeInsets.all(
                            width * 0.04,
                          ),
                          child: Card(
                            elevation: 0,
                            color: Colors.white,
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    15.0,
                                  ),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        model.newsCompleteList[index].photoUrl,
                                    errorWidget: (
                                      context,
                                      url,
                                      error,
                                    ) =>
                                        CachedNetworkImage(
                                      imageUrl:
                                          "https://firebasestorage.googleapis.com/v0/b/cryptox-aabf8.appspot.com/o/logo.png?alt=media&token=993eeaba-2bd5-4e5d-b44f-10664965b330",
                                      fit: BoxFit.cover,
                                    ),
                                    height: height * 0.25,
                                    width: width * 0.81,
                                  ),
                                ),
                                ListTile(
                                  title: Container(
                                    margin: const EdgeInsets.only(
                                      bottom: 7,
                                      top: 7,
                                    ),
                                    child: AutoSizeText(
                                      model.newsCompleteList[index].title,
                                      maxLines: 2,
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  subtitle: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          bottom: getDescriptionLength(
                                            model.newsCompleteList[index]
                                                .description.length,
                                          ),
                                        ),
                                        child: AutoSizeText(
                                          model.newsCompleteList[index]
                                              .description,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                          style: GoogleFonts.poppins(
                                            color: Colors.black54,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Expanded(
                                            child: AutoSizeText(
                                              "${convertToAgo(
                                                model.newsCompleteList[index]
                                                    .publishedDate,
                                              )} \u2022",
                                              maxLines: 1,
                                              style: GoogleFonts.poppins(
                                                color: Colors.black54,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                          AutoSizeText(
                                            model
                                                .newsCompleteList[index].source,
                                            maxLines: 1,
                                            style: GoogleFonts.poppins(
                                              color: Colors.black54,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
      ),
    );
  }
}
