import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:tinder_clone/data/explore_json.dart';
import 'package:tinder_clone/data/icons.dart';
import 'package:tinder_clone/theme/colors.dart';
import 'package:tinder_clone/data/pages_json.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with TickerProviderStateMixin {
  CardController controller;

  List itemsTemp = [];
  List pagesList = [];
  int itemLength = 0;
  int pageLength = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      itemsTemp = explore_json;
      itemLength = explore_json.length;
      pagesList = pages_json;
      pageLength = pages_json.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
      // body: Image.network(
      //     'https://storage.googleapis.com/scrapbox-file-distribute/612abcd913c7db001d7341e4/0efe6ce60629950084ab21b2ee104666?X-Goog-Algorithm=GOOG4-RSA-SHA256&X-Goog-Credential=file-upload%40scrapbox-server.iam.gserviceaccount.com%2F20211007%2Fauto%2Fstorage%2Fgoog4_request&X-Goog-Date=20211007T070051Z&X-Goog-Expires=300&X-Goog-SignedHeaders=host&X-Goog-Signature=9b011422d9a56616335437b7568225b2a72c5efede366df3e6e54ffefa92ea5aa4b56a1823505c230d4fd821008a47d48accc2bcf19ba94a5668b24d43da075b7949156f036b91f7dfcd06a287bd4e1f8a5ac41afc27fcc6e39656850552131163ef57e01f217d848d6682c8af6cdf72a6ede5e53397f895acc00130120b90ff4e099a16e1c88b49ac0f006dfab58bb85c6851053a465943dc215e92b226cbe1a6279853786700ef21707795770fecb1423040577ae391ca1cda4e016274258a9ed418781f7da3406ce5f7767788fd84611ece3702a978fc47fd5866af3b88d914674ee2d5ffab8cab877988b198cb708f8ce308a667768d80e184d7c6af85ef',
      //     width: 200,
      //     height: 300),
      bottomSheet: getBottomSheet(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: 120),
      child: Container(
        height: size.height,
        child: TinderSwapCard(
          totalNum: pageLength,
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height * 0.75,
          minWidth: MediaQuery.of(context).size.width * 0.75,
          minHeight: MediaQuery.of(context).size.height * 0.6,
          cardBuilder: (context, index) => Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      // color: grey.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 2),
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Container(
                    width: size.width,
                    height: size.height,
                    // child: Image.network(pagesList[index]['image']),
                    child: Image.asset("assets/images/tree.jpg"),
                  ),
                  Container(
                    width: size.width,
                    height: size.height,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          black.withOpacity(0.25),
                          black.withOpacity(0),
                        ],
                            end: Alignment.topCenter,
                            begin: Alignment.bottomCenter)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            children: [
                              Container(
                                width: size.width * 0.67,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          pagesList[index]['title'],
                                          style: TextStyle(
                                              color: white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          pagesList[index]["views"],
                                          style: TextStyle(
                                            color: white,
                                            fontSize: 22,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                              color: green,
                                              shape: BoxShape.circle),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Recently Active",
                                          style: TextStyle(
                                            color: white,
                                            fontSize: 16,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    // Row(
                                    //   children: List.generate(
                                    //       pagesList[index]['likes'].length,
                                    //       (indexLikes) {
                                    //     if (indexLikes == 0) {
                                    //       return Padding(
                                    //         padding:
                                    //             const EdgeInsets.only(right: 8),
                                    //         child: Container(
                                    //           decoration: BoxDecoration(
                                    //               border: Border.all(
                                    //                   color: white, width: 2),
                                    //               borderRadius:
                                    //                   BorderRadius.circular(30),
                                    //               color:
                                    //                   white.withOpacity(0.4)),
                                    //           child: Padding(
                                    //             padding: const EdgeInsets.only(
                                    //                 top: 3,
                                    //                 bottom: 3,
                                    //                 left: 10,
                                    //                 right: 10),
                                    //             child: Text(
                                    //               pagesList[index]['likes']
                                    //                   [indexLikes],
                                    //               style:
                                    //                   TextStyle(color: white),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       );
                                    //     }
                                    //     return Padding(
                                    //       padding:
                                    //           const EdgeInsets.only(right: 8),
                                    //       child: Container(
                                    //         decoration: BoxDecoration(
                                    //             borderRadius:
                                    //                 BorderRadius.circular(30),
                                    //             color: white.withOpacity(0.2)),
                                    //         child: Padding(
                                    //           padding: const EdgeInsets.only(
                                    //               top: 3,
                                    //               bottom: 3,
                                    //               left: 10,
                                    //               right: 10),
                                    //           child: Text(
                                    //             pagesList[index]['likes']
                                    //                 [indexLikes],
                                    //             style: TextStyle(color: white),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     );
                                    //   }),
                                    // )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: size.width * 0.2,
                                  child: Center(
                                    child: Icon(
                                      Icons.info,
                                      color: white,
                                      size: 28,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          cardController: controller = CardController(),
          swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
            /// Get swiping card's alignment
            if (align.x < 0) {
              //Card is LEFT swiping
            } else if (align.x > 0) {
              //Card is RIGHT swiping
            }
            // print(pagesList.length);
          },
          swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
            /// Get orientation & index of swiped card!
            if (index == (pagesList.length - 1)) {
              setState(() {
                pageLength = pagesList.length - 1;
              });
            }
          },
        ),
      ),
    );
  }

  Widget getBottomSheet() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 120,
      decoration: BoxDecoration(color: white),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(item_icons.length, (index) {
            return Container(
              width: item_icons[index]['size'],
              height: item_icons[index]['size'],
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      color: grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 10,
                      // changes position of shadow
                    ),
                  ]),
              child: Center(
                child: SvgPicture.asset(
                  item_icons[index]['icon'],
                  width: item_icons[index]['icon_size'],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
