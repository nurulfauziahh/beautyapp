import 'package:beautyapp/ui/preview_page.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class LoadingAnimatePage extends StatefulWidget {
  final XFile picture;
  // final int launch;

  const LoadingAnimatePage({
    Key? key,
    required this.picture,
  }) : super(key: key);

  @override
  State<LoadingAnimatePage> createState() => _LoadingAnimatePageState();
}

class _LoadingAnimatePageState extends State<LoadingAnimatePage> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  int bottomMargin = 0;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 0,
      upperBound: 100,
    );
    controller.addListener(() {
      setState(() {});
    });

    controller.repeat(reverse: true);
    // TODO: implement initState
    // controller = AnimationController(vsync: this, duration: Duration(seconds: 5));
    // animation = Tween<double>(begin: 0, end: 300).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    // controller.forward();
    // // The looping is done via listener.
    // controller.addListener(() {
    //   if (controller.isCompleted) {
    //     controller.reverse();
    //   }
    //   if (controller.isDismissed) {
    //     controller.forward();
    //   }
    // });
    // controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);

    // animation = Tween<double>(begin: 0, end: 300).animate(controller)
    //   ..addListener(() {
    //     setState(() {
    //       if (controller.isCompleted) {
    //         controller.reverse();
    //       }
    //       if (controller.isDismissed) {
    //         controller.forward();
    //       }
    //       // The state that has changed here is the animation object’s value.
    //     });
    //   });
    // controller.forward();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PreviewPage(
                    picture: widget.picture,
                  )));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff9c1f60),
      body: Column(
        children: [
          animasi(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget animasi() {
    return Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: <Widget>[
        Center(
          // top: 200,
          child: Container(
            margin: EdgeInsets.only(top: controller.value),
            height: 150,
            width: 200,
            child: Image.asset('assets/brain.png'),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 500),
            child: Column(
              children: [
                Text(
                  'Mohon tunggu beberapa saat..',
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('Simsalabim Abracadabra!',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
