import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:percent_indicator/circular_percent_indicator.dart';

// class PreviewPage extends StatelessWidget {
//   const PreviewPage({Key? key, required this.picture}) : super(key: key);

//   final XFile picture;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Preview Page')),
//       body: Center(
//         child: Column(mainAxisSize: MainAxisSize.min, children: [
//           Image.file(File(picture.path), fit: BoxFit.cover, width: 250),
//           const SizedBox(height: 24),
//           Text(picture.name)
//         ]),
//       ),
//     );
//   }
// }

class PreviewPage extends StatefulWidget {
  final XFile picture;

  const PreviewPage({Key? key, required this.picture}) : super(key: key);

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
            height: MediaQuery.of(context).size.height,
            child: Image.file(File(widget.picture.path), fit: BoxFit.cover, width: MediaQuery.of(context).size.width)),
        Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet<void>(
                  context: context,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  builder: (BuildContext context) {
                    return Container(
                      height: 500,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Container(
                              width: 60,
                              height: 5,
                              margin: EdgeInsets.only(left: 20, right: 20),
                              decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(16)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CircularPercentIndicator(
                                    radius: 40.0,
                                    animation: true,
                                    animationDuration: 1200,
                                    lineWidth: 15.0,
                                    percent: 0.75,
                                    center: new Text(
                                      "75",
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.orange),
                                    ),
                                    circularStrokeCap: CircularStrokeCap.butt,
                                    backgroundColor: Colors.white10,
                                    progressColor: Colors.orange,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Text('Your Overall Skin Score is ',
                                            style: new TextStyle(
                                                fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black)),
                                        Text('Good',
                                            style: new TextStyle(
                                                fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.orange)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 100,
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        CircularPercentIndicator(
                                          radius: 40.0,
                                          animation: true,
                                          animationDuration: 1200,
                                          lineWidth: 15.0,
                                          percent: 0.75,
                                          center: new Text(
                                            "75",
                                            style: new TextStyle(
                                                fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.orange),
                                          ),
                                          circularStrokeCap: CircularStrokeCap.butt,
                                          backgroundColor: Colors.white10,
                                          progressColor: Colors.orange,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Text('Good',
                                                  style: new TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15.0,
                                                      color: Colors.orange)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        CircularPercentIndicator(
                                          radius: 40.0,
                                          animation: true,
                                          animationDuration: 1200,
                                          lineWidth: 15.0,
                                          percent: 0.75,
                                          center: new Text(
                                            "75",
                                            style: new TextStyle(
                                                fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.orange),
                                          ),
                                          circularStrokeCap: CircularStrokeCap.butt,
                                          backgroundColor: Colors.white10,
                                          progressColor: Colors.orange,
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Text('Good',
                                                  style: new TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15.0,
                                                      color: Colors.orange)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 100,
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        CircularPercentIndicator(
                                          radius: 40.0,
                                          animation: true,
                                          animationDuration: 1200,
                                          lineWidth: 15.0,
                                          percent: 0.75,
                                          center: new Text(
                                            "75",
                                            style: new TextStyle(
                                                fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.orange),
                                          ),
                                          circularStrokeCap: CircularStrokeCap.butt,
                                          backgroundColor: Colors.white10,
                                          progressColor: Colors.orange,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Text('Good',
                                                  style: new TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15.0,
                                                      color: Colors.orange)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        CircularPercentIndicator(
                                          radius: 40.0,
                                          animation: true,
                                          animationDuration: 1200,
                                          lineWidth: 15.0,
                                          percent: 0.75,
                                          center: new Text(
                                            "75",
                                            style: new TextStyle(
                                                fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.orange),
                                          ),
                                          circularStrokeCap: CircularStrokeCap.butt,
                                          backgroundColor: Colors.white10,
                                          progressColor: Colors.orange,
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Text('Good',
                                                  style: new TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15.0,
                                                      color: Colors.orange)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  });
            },
            child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0),
                    )),
                height: 200,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 60,
                          height: 5,
                          margin: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(16)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircularPercentIndicator(
                                radius: 40.0,
                                animation: true,
                                animationDuration: 1200,
                                lineWidth: 15.0,
                                percent: 0.75,
                                center: new Text(
                                  "75",
                                  style:
                                      new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.orange),
                                ),
                                circularStrokeCap: CircularStrokeCap.butt,
                                backgroundColor: Colors.white10,
                                progressColor: Colors.orange,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Text('Your Overall Skin Score is ',
                                        style: new TextStyle(
                                            fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black)),
                                    Text('Good',
                                        style: new TextStyle(
                                            fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.orange)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ]),

      // bottomSheet: Container(
      //   decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      //   height: 50,
      //   width: double.infinity,
      //   child: GestureDetector(
      //     onTap: () {
      //       showModalBottomSheet<void>(
      //           context: context,
      //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      //           builder: (BuildContext context) {
      //             return Container(
      //               height: 500,
      //               decoration: const BoxDecoration(
      //                   color: Colors.white,
      //                   borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      //               child: Column(
      //                 mainAxisSize: MainAxisSize.min,
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: <Widget>[
      //                   const SizedBox(
      //                     height: 20,
      //                   ),
      //                   Center(
      //                       child: Text(
      //                     'Ubah Absensi',
      //                     // style: TextHelper.black16w600,
      //                   )),
      //                 ],
      //               ),
      //             );
      //           });
      //     },
      //     child: Container(child: Text('data')),
      //   ),
      // ),
    );
  }
}
