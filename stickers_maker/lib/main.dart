import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:share/share.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:esys_flutter_share/esys_flutter_share.dart';

import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sticker Maker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExampleHomePage(),
    );
  }
}

class ExampleHomePage extends StatefulWidget {
  @override
  _ExampleHomePageState createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<ExampleHomePage>
    with TickerProviderStateMixin {
  Image image;
  Image image1;
  Image image2;
  Image image3;
  Image image4;
  Image image5;
  String HERO;

  List<Image> stickerImages =[];
  List imageStr;

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  List<String> welcomeImages = [
    "images/welcome0.png",
    "images/welcome1.png",
    "images/welcome2.png",
    "images/pony0.png",
  ];

  @override
  Widget build(BuildContext context) {

    CardController controller; //Use this to trigger swap.

    return new Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: TextField(
          controller: myController,
          decoration: InputDecoration(
              hintText: 'An image of a smiling anime girl in a dress',
              prefixIcon: Icon(Icons.search)
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: new Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          child: new TinderSwapCard(
            orientation: AmassOrientation.TOP,
            totalNum: 1,
            stackNum: 2,
            swipeEdge: 4.0,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            maxHeight: MediaQuery.of(context).size.width * 0.9,
            minWidth: MediaQuery.of(context).size.width * 0.8,
            minHeight: MediaQuery.of(context).size.width * 0.8,
            cardBuilder: (context, index) {
              print('index ${index}');
              return ListView(
                children: [
              Card(
              child: Column(
              mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    // leading: Icon(Icons.check),
                    // title: Text(''),
                    // subtitle: Text(''),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: image1,
                        onPressed:  ()  {
                          return new FlareActor("images/pumping-heart.flr", alignment:Alignment.center, fit:BoxFit.contain);

                          // FilePickerResult result = await FilePicker.platform.pickFiles();
                          // if (result != null) {
                          //   print(result.files.single.path);
                          //   // Share.shareFiles(["${result.files.single.path}"], text: "Images");
                          // }
                        },),
                      FlatButton(
                        child: const Text('Share'),
                        onPressed:  () async {
                          final request = await http.post('https://aistickers.eu.ngrok.io/imgid',body:json.encode({
                            'imgid': 0}),headers: {"Content-Type": "application/json"});


                          var imgNum = 1;
                          String response = await json.decode(request.body);
                          _save() async {
                            final result = await ImageGallerySaver.saveImage(
                                Uint8List.fromList(base64Decode(response)),
                                quality: 100,
                                name: "${HERO}${imgNum}",
                                isReturnImagePathOfIOS:true);
                            print(result);
                          }
                          _save();
                          Share.shareFiles(['/storage/emulated/0/Pictures/${HERO}${imgNum}.jpg']);

                        },
                      ),
                    ],
                  ),
                ],
              ),
              ),           Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          // leading: Icon(Icons.check),
                          // title: Text(''),
                          // subtitle: Text(''),
                        ),
                        ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: image2,
                              // onPressed:  () async {
                              //   FilePickerResult result = await FilePicker.platform.pickFiles();
                              //   if (result != null) {
                              //     print(result.files.single.path);
                              //
                              //   }
                              // },
                            ),
                            FlatButton(
                              child: const Text('Share'),
                              onPressed:  () async {
                                final request = await http.post('https://aistickers.eu.ngrok.io/imgid',body:json.encode({
                                  'imgid': 1}),headers: {"Content-Type": "application/json"});

                                var imgNum = 2;
                                String response = await json.decode(request.body);
                                _save() async {
                                  final result = await ImageGallerySaver.saveImage(
                                      Uint8List.fromList(base64Decode(response)),
                                      quality: 100,
                                      name: "${HERO}${imgNum}",
                                      isReturnImagePathOfIOS:true);
                                  print(result);
                                }
                                _save();
                                Share.shareFiles(['/storage/emulated/0/Pictures/${HERO}${imgNum}.jpg']);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          // leading: Icon(Icons.check),
                          // title: Text(''),
                          // subtitle: Text(''),
                        ),
                        ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: image3,
                              // onPressed:  () async {
                              //   FilePickerResult result = await FilePicker.platform.pickFiles();
                              //   if (result != null) {
                              //     print(result.files.single.path);
                              //
                              //   }
                              // },
                            ),
                            FlatButton(
                              child: const Text('Share'),
                              onPressed:  () async {
                                final request = await http.post('https://aistickers.eu.ngrok.io/imgid',body:json.encode({
                                  'imgid': 2}),headers: {"Content-Type": "application/json"});

                                var imgNum = 3;
                                String response = await json.decode(request.body);
                                _save() async {
                                  final result = await ImageGallerySaver.saveImage(
                                      Uint8List.fromList(base64Decode(response)),
                                      quality: 100,
                                      name: "${HERO}${imgNum}",
                                      isReturnImagePathOfIOS:true);
                                  print(result);
                                }
                                _save();
                                Share.shareFiles(['/storage/emulated/0/Pictures/${HERO}${imgNum}.jpg']);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),          Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          // leading: Icon(Icons.check),
                          // title: Text(''),
                          // subtitle: Text(''),
                        ),
                        ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: image4,
                              // onPressed:  () async {
                              //   FilePickerResult result = await FilePicker.platform.pickFiles();
                              //   if (result != null) {
                              //     print(result.files.single.path);
                              //
                              //   }
                              // },
          ),
                            FlatButton(
                              child: const Text('Share'),
                              onPressed:  () async {
                                final request = await http.post('https://aistickers.eu.ngrok.io/imgid',body:json.encode({
                                  'imgid': 3}),headers: {"Content-Type": "application/json"});
                                var imgNum = 4;
                                String response = await json.decode(request.body);
                                _save() async {
                                  final result = await ImageGallerySaver.saveImage(
                                      Uint8List.fromList(base64Decode(response)),
                                      quality: 100,
                                      name: "${HERO}${imgNum}",
                                      isReturnImagePathOfIOS:true);
                                  print(result);
                                }
                                _save();
                                Share.shareFiles(['/storage/emulated/0/Pictures/${HERO}${imgNum}.jpg']);

                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),



          ],
              );
            },
            cardController: controller = CardController(),
            swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
              /// Get swiping card's alignment
              if (align.x < 0) {
                //print("Card is LEFT swiping");
              } else if (align.x > 0) {
                //print("Card is RIGHT swiping");
              }
            },
            swipeCompleteCallback:
                (CardSwipeOrientation orientation, int index) {
              print(orientation.toString());
              if (orientation == CardSwipeOrientation.LEFT) {
                print("Card is LEFT swiping");
                print(welcomeImages.length);
              } else if (orientation == CardSwipeOrientation.RIGHT) {
                print("Card is RIGHT swiping");
                print(welcomeImages.length);
              }
            },
          ),
        ),

    ), floatingActionButton: SpeedDial(
        elevation: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26.withOpacity(0.3),
              spreadRadius: 7,
              blurRadius: 7,
              offset: Offset(3, 5),
            ),
          ],
        ),
      ),

        onOpen: () {

          HapticFeedback.heavyImpact();
        },
        onClose: () {

          HapticFeedback.heavyImpact();
        },

//provide here features of your parent FAB

        children: [
          SpeedDialChild(
            child: Image.asset('images/pony0.png'),
            // child: image2,
            label: 'I want pony',
            onTap: () async { //async function to perform http get
              HERO = 'pony';
              // final response = await http.get('https://e8eda64ab372.ngrok.io'); //getting the response from our backend server script
              // String hero = 'pony';
              final request = await http.post('https://aistickers.eu.ngrok.io',body:json.encode({
                'id': myController.text, 'hero': HERO}),headers: {"Content-Type": "application/json"});

              List<dynamic> imageStr = json.decode(request.body);//.tolist();//.toString();
              // byteimg = imageStr[0];
              image1 = Image.memory(base64Decode(imageStr[0].toString()));
              image2 = Image.memory(base64Decode(imageStr[1].toString()));
              image3 = Image.memory(base64Decode(imageStr[2].toString()));
              image4 = Image.memory(base64Decode(imageStr[3].toString()));
              // image5 = Image.memory(base64Decode(imageStr[4].toString()));
              List<Image> stickerImages =[image1,image2,image3,image4];
              _save() async {
                // var response = await Dio().get(
                //     "https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=a62e824376d98d1069d40a31113eb807/838ba61ea8d3fd1fc9c7b6853a4e251f94ca5f46.jpg",
                //     options: Options(responseType: ResponseType.bytes));
                final result = await ImageGallerySaver.saveImage(
                    Uint8List.fromList(imageStr),
                    quality: 60,
                    name: "hello.png");
                print(result);
              }


              setState(() {

                _save();
              });


            },),
          SpeedDialChild(
            child: Image.asset('${welcomeImages[2]}'),
            // child: image2,
            label: 'I want anime',
            onTap: () async { //async function to perform http get
              HERO = 'anime';
              // final response = await http.get('https://e8eda64ab372.ngrok.io'); //getting the response from our backend server script
              // String hero = 'pony';
              final request = await http.post('https://aistickers.eu.ngrok.io',body:json.encode({
                'id': myController.text, 'hero': HERO}),headers: {"Content-Type": "application/json"});

              List<dynamic> imageStr = json.decode(request.body);//.tolist();//.toString();
              image1 = Image.memory(base64Decode(imageStr[0].toString()));
              image2 = Image.memory(base64Decode(imageStr[1].toString()));
              image3 = Image.memory(base64Decode(imageStr[2].toString()));
              image4 = Image.memory(base64Decode(imageStr[3].toString()));
              // image5 = Image.memory(base64Decode(imageStr[4].toString()));
              List stickerImages =[image1,image2,image3,image4];


              setState(() {

                stickerImages;
              });


            },), SpeedDialChild(
            child: Image.asset('images/more0.gif'),
            // child: image2,
            label: 'I want more',
            onTap: () async { },),

        ]
    ),
    );
  }
}
