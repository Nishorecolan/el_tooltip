import 'package:flutter/material.dart';

import 'el_tooltip.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'Temporary Coverage';
  //String subTitle ='For specific details about this coverage, please contact your agent';
 String subTitle ='For specific details about this coverage, please contact your agent \n For specific details about this coverage, please contact your agent\n For specific details about this coverage, please contact your agent\n For specific details about this coverage, please contact your agent\n For specific details about this coverage, please contact your agent\n For specific details about this coverage, please contact your agent';
  ScrollController controller = ScrollController();
  ElTooltip? eltoolTipVar;


  @override
  Widget build(BuildContext context) {
    final screenWidth  = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: GestureDetector(
          onPanUpdate: (details) {
            // Handle touch events here
            print('Global position: ${details.globalPosition}');
            print('Local position: ${details.localPosition}');
            if (details.globalPosition.dy < screenHeight / 2) {
              if (details.globalPosition.dx < screenWidth / 2) {
                print('left side of screen');
                // Touch is on the top-left quadrant of the screen
              } else {
                // Touch is on the top-right quadrant of the screen
                print('right side of screen');
              }
            } else {
              // Touch is on the bottom half of the screen
              if (details.globalPosition.dx < screenWidth / 2) {
                print('bottom left side of screen');
                // Touch is on the top-left quadrant of the screen
              } else {
                // Touch is on the top-right quadrant of the screen
                print('bottom right side of screen');
              }
              //print('bottom side of screen');
            }
          },
          child: Scaffold(
              backgroundColor: Colors.grey.shade200,
              body: SingleChildScrollView(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (val) {
                    print(controller.position.pixels);
                    if (controller.position.pixels ==
                        controller.position.minScrollExtent) {
                      eltoolTipVar!.elToolTipState?.hideOverlay();
                    }
                    return true;
                  },
                  // Return true to cancel the notification bubbling. Return false (or null) to
                  // allow the notification to continue to be dispatched to further ancestors.
                  // return true;
                  // child: ListView.builder(
                  //   controller: controller,
                  //   itemBuilder: (context, int) {
                  //     return buildInfo(context);
                  //   },
                  //   itemCount: 20,
                  // ),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildElToolTip(context, longTailPosition: 'Left'),
                          buildElToolTip(context),
                          buildElToolTip(context, longTailPosition: 'Right'),
                        ],
                      ),
                      Tooltip(message: 'Data', child: Icon(Icons.dangerous)),
                      //  SizedBox(height: 500),
                      Text.rich(TextSpan(children: [
                        const TextSpan(
                            text:
                                'Contracts issued in any of these states will continue to receive premium notices by U.S Mail '
                                'Contracts issued in any of these states will continue to receive premium notices by U.S Mail                       '
                                '                                          able                     '
                                '                                              to                 '
                                '                                                  received          tomorrow    at         '
                                '                                                 10                  '
                                '                                                 10'),
                        // WidgetSpan(child: SizedBox(width: 200)),
                        WidgetSpan(
                            child: buildElToolTip(context, longTailPosition: 'Left'))
                        // buildElToolTip(context),
                      ])),

                      SizedBox(height: 80),
                      Text.rich(TextSpan(children: [
                        const TextSpan(
                            text:
                                'Contracts issued in any of these states will continue to receive premium notices by U.S Mail '
                                'Contracts issued in any of these states will continue to receive premium notices by U.S Mail                      '
                                '                                          able                     '
                                '                                              to                 '
                                '                                                                received          tomorrow    at         '
                                '      10                                                                               '
                                '      10                    '),
                        // WidgetSpan(child: SizedBox(width: 200)),
                        WidgetSpan(
                            child: buildElToolTip(context, longTailPosition: 'Left'))
                        // buildElToolTip(context),
                      ])),

                      SizedBox(height: 100),
                      Text.rich(TextSpan(children: [
                        const TextSpan(
                            text:
                                'Contracts issued in any of these states will continue to receive premium notices by U.S Mail '
                                'Contracts issued in any of these states will continue to receive premium notices by U.S Mail                      '
                                '                                          able                     '
                                '                                              to                 '
                                '                                                  received          tomorrow    at         '
                                '      10                                               '),
                        // WidgetSpan(child: SizedBox(width: 200)),
                        WidgetSpan(
                            child: buildElToolTip(context, longTailPosition: 'Left'))
                        // buildElToolTip(context),
                      ])),

                      SizedBox(height: 50),
                      Text.rich(TextSpan(children: [
                        const TextSpan(
                            text:
                                'Contracts issued in any of these states will continue to receive premium notices by U.S Mail '
                                'Contracts issued in any of these states will continue to receive premium notices by U.S Mail                      '
                                '                                          able                     '
                                '                                              to                 '
                                '                                                  received          tomorrow    at         '
                                '      10     '),
                        // WidgetSpan(child: SizedBox(width: 200)),
                        WidgetSpan(
                            child: buildElToolTip(context))
                        // buildElToolTip(context),
                      ])),

                      SizedBox(height: 50),
                      Text.rich(TextSpan(children: [
                        const TextSpan(
                            text:
                                'Contracts issued in any of these states will continue to receive premium notices by U.S Mail '
                                'Contracts issued in any of these states will continue to receive premium notices by U.S Mail                      '
                                '                                          able                     '
                                '                                              to                 '
                                '                                                  received          tomorrow    at         '
                                '      10                           '
                                '      10             '
                                '      10             '
                                '      10      '
                                '      10     '),
                        // WidgetSpan(child: SizedBox(width: 200)),
                        WidgetSpan(
                            child: buildElToolTip(context))
                        // buildElToolTip(context),
                      ])),

                      SizedBox(height: 50),
                      Text.rich(TextSpan(children: [
                        const TextSpan(
                            text:
                                'Contracts issued in any of these states will continue to receive premium notices by U.S Mail '
                                'Contracts issued in any of these states will continue to receive premium notices by U.S Mail                      '
                                '                                          able                     '
                                '                                              to                 '
                                '                                                  received          tomorrow    at         '
                                '      10                           '
                                '      10             '
                                '      10             '
                                '      10             '
                                '      10             '
                                '      10         '
                                '      10     '),
                        // WidgetSpan(child: SizedBox(width: 200)),
                        WidgetSpan(
                            child: buildElToolTip(context, longTailPosition: 'Right'))
                        // buildElToolTip(context),
                      ])),

                      SizedBox(height: 50),
                      Text.rich(TextSpan(children: [
                        const TextSpan(
                            text:
                            'Contracts issued in any of these states will continue to receive premium notices by U.S Mail '
                                'Contracts issued in any of these states will continue to receive premium notices by U.S Mail                      '
                                '                                          able                     '
                                '                                              to                 '
                                '                                                  received          tomorrow    at         '
                                '      10                           '
                                '      10             '
                                '      10  '
                                '      10  '
                                '      10             '
                                '      10             '
                                '      10             '
                                '      10     '),
                        // WidgetSpan(child: SizedBox(width: 200)),
                        WidgetSpan(
                            child: buildElToolTip(context, longTailPosition: 'Right'))
                        // buildElToolTip(context),
                      ])),

                      SizedBox(height: 50),
                    ],
                  ),
                ),
              )),
    ));
  }

  buildInfo(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: buildElToolTip(context,longTailPosition: "Left"),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 180.0),
                child: buildElToolTip(context,longTailPosition: "Right"),
              ),  
              buildElToolTip(context,
                  position: ElTooltipPosition.bottomEnd,
                  longTailPosition: 'Right'),

            ],
          ),
        ),
        const SizedBox(height: 200),
      ],
    );
  }


  Widget buildElToolTip(context,{position, longTailPosition}) {

    return eltoolTipVar =  ElTooltip(
      distance: 30,
      // showModal: false,
      longTailPosition: longTailPosition ?? 'Center',
      position: position ?? ElTooltipPosition.bottomStart,
      content: IntrinsicHeight(
        //height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(subTitle),
            const SizedBox(height: 10),
            Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                     // Navigator.pop(context);
                      eltoolTipVar!.elToolTipState?.hideOverlay();
                    },
                    child: const Text('Got it',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue))))
          ],
        ),
      ),
      child: const Icon(Icons.info),
      // position: ElTooltipPosition.bottomStart,
    );
  }
}
///
// import 'dart:ffi';
// import 'package:easy_tooltip/easy_tooltip.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter EasyTooltip'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//
//
//     return GestureDetector(
//       onPanUpdate: (details) {
//         // Handle touch events here
//         print('Global position: ${details.globalPosition}');
//         print('Local position: ${details.localPosition}');
//         if (details.globalPosition.dy < screenHeight / 2) {
//           if (details.globalPosition.dx < screenWidth / 2) {
//             print('left side of screen');
//             // Touch is on the top-left quadrant of the screen
//           } else {
//             // Touch is on the top-right quadrant of the screen
//             print('right side of screen');
//           }
//         } else {
//           // Touch is on the bottom half of the screen
//           if (details.globalPosition.dx < screenWidth / 2) {
//             print('bottom left side of screen');
//             // Touch is on the top-left quadrant of the screen
//           } else {
//             // Touch is on the top-right quadrant of the screen
//             print('bottom right side of screen');
//           }
//           //print('bottom side of screen');
//         }
//       },
//       child: Scaffold(
//           appBar: AppBar(
//             title: Text(widget.title),
//           ),
//           body: Center(
//             child: Align(
//               // mainAxisAlignment: MainAxisAlignment.center,
//               // crossAxisAlignment: CrossAxisAlignment.start,
//               alignment: Alignment.center,
//               // children: <Widget>[
//                 child: EasyTooltip(
//                   text: ' Hello world! ',
//                   arrowHeight: 70,
//                   backgroundColor: Colors.red,
//                   padding: const EdgeInsets.all(8),
//                   onEasyTooltipTap: () {
//                     debugPrint('child is tapped.');
//                   },
//                   onDismiss: () {
//                     debugPrint('tooltip is dismissed');
//                   },
//                   child: const Icon(Icons.info_outlined),
//                 ),
//               // ],
//             ),
//           )),
//     );
//   }
// }

///
// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       // home:  Scaffold(body: Center(child: ButtonMessage('data', () {}))),
//       home:  MyHomePage(title: ''),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   final String title;
//
//   const MyHomePage({
//     Key? key,
//     required this.title,
//   }) : super(key: key);
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Align(
//         alignment: Alignment.center,
//         child: Tooltip(
//           //triggerMode: TooltipTriggerMode.manual,
//           message: 'Hover Icon for Tooltip...',
//           padding: const EdgeInsets.all(20),
//           showDuration: const Duration(seconds: 10),
//           decoration: ShapeDecoration(
//             color: Colors.blue,
//             shape: ToolTipCustomShape(),
//           ),
//           textStyle: const TextStyle(color: Colors.white),
//           preferBelow: false,
//           verticalOffset: 20,
//           child:  IconButton(
//             icon: const Icon(Icons.info, size: 30.0),
//             onPressed: () {
//               print('Tapped info icon');
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ToolTipCustomShape extends ShapeBorder {
//   final bool usePadding;
//
//   ToolTipCustomShape({this.usePadding = true});
//
//   @override
//   EdgeInsetsGeometry get dimensions =>
//       EdgeInsets.only(bottom: usePadding ? 20 : 0);
//
//   @override
//   Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();
//
//   @override
//   Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
//     rect =
//         Rect.fromPoints(rect.topLeft, rect.bottomRight - const Offset(0, 20));
//     return Path()
//       ..addRRect(
//           RRect.fromRectAndRadius(rect, Radius.circular(rect.height / 3)))
//       ..moveTo(rect.bottomCenter.dx - 10, rect.bottomCenter.dy)
//       ..relativeLineTo(10, 20)
//       ..relativeLineTo(10, -20)
//       ..close();
//   }
//
//   @override
//   void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}
//
//   @override
//   ShapeBorder scale(double t) => this;
// }
//
// class MessageBorder extends ShapeBorder {
//   final bool usePadding;
//
//   MessageBorder({this.usePadding = true});
//
//   @override
//   EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: usePadding? 20 : 0);
//
//   @override
//   Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();
//
//   @override
//   Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
//     rect = Rect.fromPoints(rect.topLeft, rect.bottomRight - Offset(0, 20));
//     return Path()
//       ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(rect.height / 2)))
//       ..moveTo(rect.bottomCenter.dx - 10, rect.bottomCenter.dy)
//       ..relativeLineTo(10, 20)
//       ..relativeLineTo(20, -20)
//       ..close();
//   }
//
//   @override
//   void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}
//
//   @override
//   ShapeBorder scale(double t) => this;
// }
//
// class ButtonMessage extends StatelessWidget {
//   final String text;
//   final GestureTapCallback onTap;
//
//   const ButtonMessage(this.text, this.onTap);
//
//   final List values = const ['Ok','Cancel','Submit'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.white,
//       elevation: 4,
//       clipBehavior: Clip.antiAlias,
//       shape: MessageBorder(),
//       child: InkWell(
//         splashColor: Colors.orange,
//         hoverColor: Colors.blueGrey,
//         highlightColor: Colors.transparent,
//         onTap: onTap,
//         child: Container(
//           height: 64,
//           padding: EdgeInsets.only(bottom: 20, right: 8),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: <Widget>[
//               for (int i = 0; i < 3; i++)
//                 Padding(
//                   padding: const EdgeInsets.only(left: 3.0, right: 3.0),
//                   child: Container(
//                     width: 7,
//                     height: 8,
//                     decoration: const BoxDecoration(color: Color(0xFFCCCCCC), shape: BoxShape.circle),
//                   ),
//                 ),
//               Container(width: 6),
//               Container(
//                 width: 30,
//                 height: 30,
//                 decoration: BoxDecoration(color: Color(0xFF1287BA), shape: BoxShape.circle),
//                 child: Center(
//                   child: Text(text, style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 12)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }