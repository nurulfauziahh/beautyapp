import 'dart:developer';
import 'package:beautyapp/ui/camera/camera_page.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class StepIndicatorPage extends StatefulWidget {
  @override
  _StepIndicatorPageState createState() => _StepIndicatorPageState();
}

class _StepIndicatorPageState extends State<StepIndicatorPage> {
  int _bottomBarIndex = 0;
  int stepTotal = 5;
  int currentIndex = 1;
  PageController _pageController = PageController();
  final _controller = new PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.easeInOut;
  int currentPage = 0;
  // List<Widget> listView = [step1(), step2(), step3];
  final List<Widget> _samplePages = [
    const StepProgressIndicator(
      totalSteps: 5,
      currentStep: 1,
      selectedColor: Color(0xff9c1f60),
      unselectedColor: Colors.grey,
      size: 6,
      roundedEdges: const Radius.circular(20),
    ),
    const StepProgressIndicator(
      totalSteps: 5,
      currentStep: 2,
      selectedColor: Color(0xff9c1f60),
      unselectedColor: Colors.grey,
      size: 6,
      roundedEdges: const Radius.circular(20),
    ),
    const StepProgressIndicator(
      totalSteps: 5,
      currentStep: 3,
      selectedColor: Color(0xff9c1f60),
      unselectedColor: Colors.grey,
      size: 6,
      roundedEdges: const Radius.circular(20),
    ),
    const StepProgressIndicator(
      totalSteps: 5,
      currentStep: 4,
      selectedColor: Color(0xff9c1f60),
      unselectedColor: Colors.grey,
      size: 6,
      roundedEdges: const Radius.circular(20),
    ),
    const StepProgressIndicator(
      totalSteps: 5,
      currentStep: 5,
      selectedColor: Color(0xff9c1f60),
      unselectedColor: Colors.grey,
      size: 6,
      roundedEdges: const Radius.circular(20),
    ),
  ];
  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.initialPage;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Step Progress Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 40,
                ),
                StepProgressIndicator(
                  totalSteps: stepTotal,
                  currentStep: currentIndex,
                  selectedColor: const Color(0xff9c1f60),
                  unselectedColor: Colors.grey,
                  size: 6,
                  roundedEdges: Radius.circular(20),
                ),
                SizedBox(
                  height: 30,
                ),
                currentIndex == 1
                    ? step1()
                    : currentIndex == 2
                        ? step2()
                        : currentIndex == 3
                            ? step3()
                            : currentIndex == 4
                                ? step4()
                                : currentIndex == 5
                                    ? step5()
                                    : Container()
              ],
            ),

            //  PageView.builder(
            //   controller: _controller,
            //   itemCount: _samplePages.length,
            //   itemBuilder: ((context, index) {
            //     return _samplePages[index % _samplePages.length];
            //   }),
            //   onPageChanged: (value) {
            //     setState(() {
            //       currentPage = value;
            //     });
            //   },
            // ),
          ),
          bottomSheet: Container(
            height: 90,
            margin: const EdgeInsets.all(16),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              currentIndex == 5
                  ? Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Color(0xff9c1f60)),
                          onPressed: () async {
                            await availableCameras().then((value) =>
                                Navigator.push(context, MaterialPageRoute(builder: (_) => CameraPage(cameras: value))));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.photo_camera),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Ambil Foto')
                            ],
                          )),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 160,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: Colors.white, elevation: 0),
                            onPressed: () {
                              setState(() {
                                currentIndex <= 5 && currentIndex > 1 ? currentIndex -= 1 : null;
                              });

                              // log(currentIndex.toString());
                              // _controller.previousPage(duration: _kDuration, curve: _kCurve);
                            },
                            child: const Text(
                              'Batalkan',
                              style: const TextStyle(color: Color(0xff9c1f60)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 160,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xff9c1f60),
                            ),
                            onPressed: () {
                              // if (_pageController.hasClients) {
                              //   _pageController.animateToPage(
                              //     1,
                              //     duration: const Duration(milliseconds: 400),
                              //     curve: Curves.easeInOut,
                              //   );
                              // }
                              setState(() {
                                currentIndex >= 1 && currentIndex < 5 ? currentIndex += 1 : null;
                              });
                              // _controller.nextPage(duration: _kDuration, curve: _kCurve);
                            },
                            child: const Text('Berikutnya'),
                          ),
                        )
                      ],
                    )
            ]),
          ),
        ),
      ),
    );
  }

  Widget step1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            child: Text(
          'Bagaimana Kondisi Kulit Kamu?',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )),
        SizedBox(
          height: 20,
        ),
        Wrap(
          children: [
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xff9c1f60), width: 2)),
              child: Text('Normal'),
            ),
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xff9c1f60), width: 2)),
              child: Text('Kering'),
            ),
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xff9c1f60), width: 2)),
              child: Text('Berminyak'),
            ),
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xff9c1f60), width: 2)),
              child: Text('Sensitif'),
            ),
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xff9c1f60), width: 2)),
              child: Text('Kombinasi '),
            ),
          ],
        ),
      ],
    );
  }

  Widget step2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            child: Text(
          'Apa masalah utama kulit kamu?',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )),
        SizedBox(
          height: 20,
        ),
        Wrap(
          children: [
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xff9c1f60), width: 2)),
              child: Text('Garis halus & kerutan'),
            ),
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xff9c1f60), width: 2)),
              child: Text('Kulit kusam'),
            ),
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xff9c1f60), width: 2)),
              child: Text('Kemerahan'),
            ),
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xff9c1f60), width: 2)),
              child: Text('Pori-pori besar'),
            ),
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xff9c1f60), width: 2)),
              child: Text('Pigmentasi'),
            ),
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xff9c1f60), width: 2)),
              child: Text('Kulit Mengendur'),
            ),
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xff9c1f60), width: 2)),
              child: Text('Noda kulit'),
            ),
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xff9c1f60), width: 2)),
              child: Text('Mata bengkak'),
            ),
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xff9c1f60), width: 2)),
              child: Text('Dark spots'),
            ),
          ],
        ),
      ],
    );
  }

  Widget step3() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            child: Text(
          'Berapa umur kamu?',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )),
        SizedBox(
          height: 20,
        ),
        Wrap(
          children: [
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xff9c1f60), width: 2)),
              child: Text('18-24 Tahun'),
            ),
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xff9c1f60), width: 2)),
              child: Text('25-34 Tahun'),
            ),
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xff9c1f60), width: 2)),
              child: Text('35-44 Tahun'),
            ),
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xff9c1f60), width: 2)),
              child: Text('45-54 Tahun'),
            ),
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xff9c1f60), width: 2)),
              child: Text('55+ Tahun'),
            ),
          ],
        ),
      ],
    );
  }

  Widget step4() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            child: Text(
          'Dimana lokasi anda sering menghabiskan waktu?',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.all(4),
          padding: EdgeInsets.all(8),
          child: TextFormField(
            decoration: InputDecoration(prefixIcon: Icon(Icons.location_pin), hintText: 'Bandung, Jawa Barat'),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                  // border: Border.all(color: Color(0xff9c1f60), width: 2)
                  ),
              child: Column(
                children: [
                  Icon(
                    Icons.sunny,
                    color: Colors.amber[600],
                    size: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'UV Index 15',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                  // border: Border.all(color: Color(0xff9c1f60), width: 2)
                  ),
              child: Column(
                children: [
                  Icon(
                    Icons.water_drop_outlined,
                    color: Colors.amber[600],
                    size: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Humidity 20%',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                  // border: Border.all(color: Color(0xff9c1f60), width: 2)
                  ),
              child: Column(
                children: [
                  Icon(
                    Icons.cloud,
                    color: Colors.amber[600],
                    size: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Pollution 20',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget step5() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
        ),
        Center(
            child: SizedBox(
                child: Text(
          'Ambil foto selfie anda',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ))),
        SizedBox(
          height: 10,
        ),
        Center(
            child: SizedBox(
                child: Text(
          'Lorem ipsum dolor sit amet, consectetur',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
        ))),
        SizedBox(
          height: 30,
        ),
        Container(
          height: 250,
          width: 400,
          margin: EdgeInsets.all(4),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/foto.PNG'), fit: BoxFit.cover)
              // borderRadius: BorderRadius.circular(20),
              // border: Border.all(color: Color(0xff9c1f60), width: 2)
              ),
          // child: Text('18-24 Tahun'),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
            child: Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  'Untuk hasil yang maksimal pastikan anda berada di tempat dengan pencahayaan yang cukup',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                ))),
      ],
    );
  }
}
