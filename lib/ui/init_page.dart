import 'package:beautyapp/ui/step_progress_page.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  final _totalDots = 5;
  double _currentPosition = 0.0;

  double _validPosition(double position) {
    if (position >= _totalDots) return 0;
    if (position < 0) return _totalDots - 1.0;
    return position;
  }

  void _updatePosition(double position) {
    setState(() => _currentPosition = _validPosition(position));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(image: AssetImage('assets/image.jpg'), fit: BoxFit.cover)),
          ),
          Align(
            // alignment: Alignment.topCenter,
            heightFactor: MediaQuery.of(context).size.height / 110,
            child: Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3.3,
                  ),
                  Text(
                    'Skin Analyzer',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.height * 0.14, //120,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Text(
                    'Analisa Kondisi Kulit Kamu',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur. ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w200, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DotsIndicator(
                    dotsCount: 3,
                    position: 0,
                    decorator: DotsDecorator(
                        size: const Size.square(9.0),
                        activeSize: const Size(18.0, 9.0),
                        color: Colors.grey,
                        activeColor: Color(0xff9c1f60)
                        // activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        ),
                  ),
                ],
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                //  margin: EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0),
                    )),
                height: 100,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Color(0xff9c1f60)),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => StepIndicatorPage()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.face),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Mulai Sekarang')
                              ],
                            )),
                      )
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
