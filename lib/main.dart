// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:new_template/Hero_Animation/MasterDetailRentCars.dart';
import 'package:new_template/route_configuration.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'Hero_Animation/MasterDetailImportedCars.dart';
import 'Hero_Animation/MasterDetailNewCars.dart';
import 'Hero_Animation/MasterDetailUsedCars.dart';
//import 'package:convex_bottom_bar/convex_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const pageName = '/';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // routes: {
      //   MyApp.pageName: (context) => MyHomePage(),
      //   SecondScreen.pageName: (context) => SecondScreen(),
      // },
      onGenerateRoute: routeConfigration,
      initialRoute: '/',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//var index=1;
  int _current = 0;
  var textDetail = [
    'Rents a Car',
    'New Cars',
    'Used Cars',
    'Imported Cars',
  ];
  var imgList = [
    'assets/car1.png',
    'assets/car2.png',
    'assets/car3.png',
    'assets/car4.png',
    'assets/car5.png'
  ];

  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PAK Motors',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
        //leading: Icon(Icons.menu),
        actions: [Icon(Icons.search)],
      ),
      drawer: Drawer(
        child: Container(
          //padding: const EdgeInsets.only(top: 30,left: 8.0,),
          color: Colors.blue.shade100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height*0.3,
                color: Colors.blue.shade600,
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('About Us', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),

              ),
              ListTile(
                leading: Icon(Icons.notifications_active),
                title: Text('Notification', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),

              ),
              ListTile(
                leading: Icon(Icons.connected_tv_rounded),
                title: Text('Terms & Conditions', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),

              ),
              ListTile(
                leading: Icon(Icons.login),
                title: Text('Login', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),

              ),
              ListTile(
                leading: Icon(Icons.privacy_tip),
                title: Text('Privacy Policy', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),

              ),
            ],
          ),
        ),
      ),
      body: ListView( children: [
        Container(
          color: Colors.blue.shade200,
          height: height*0.28,
          //width: width,
          child: CarouselSlider(
            items: [
              Image.asset('assets/car1.png'),
              Image.asset(
                'assets/car2.png',
              ),
              Image.asset('assets/car3.png'),
            ],
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: imgList.asMap().entries.map((entry) {
        //     return GestureDetector(
        //       onTap: () => _controller.animateToPage(entry.key),
        //       child: Container(
        //         width: 12.0,
        //         height: 12.0,
        //         margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        //         decoration: BoxDecoration(
        //             shape: BoxShape.circle,
        //             color: (Theme.of(context).brightness == Brightness.dark
        //                     ? Colors.white
        //                     : Colors.black)
        //                 .withOpacity(_current == entry.key ? 0.9 : 0.4)),
        //       ),
        //     );
        //   }).toList(),
        // ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            height: 35,
            width: width * 0.4,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: Text(
              'We Deals In',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),

        Container(
          height: 500,
          child: GridView.count(crossAxisCount: 2,
          children: List.generate(4, (index) {
            return Card(
              color: Colors.blue.shade100,
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: InkWell(
                      onTap:() {
                        if (index == 0) {
                          Navigator.pushNamed(context, Products.pageName);
                        }
                        else if (index == 1) {
                          Navigator.pushNamed(context, NewProducts.pageName);
                        }
                        else if (index == 2) {
                          Navigator.pushNamed(context, UsedProducts.pageName);
                        }
                        else if (index == 3) {
                          Navigator.pushNamed(context, ImportedProducts.pageName);
                        }
                        else{
                          print('Invalid Object');
                        }

                      },
                      child: Image.asset(imgList[index+1], fit: BoxFit.fill,)),),
                  Expanded(flex: 1,child: Text(textDetail[index], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                ],
              ),
            );
          })
          ),
        )
      ]),
      // floatingActionButton: FloatingActionButton(
      //   hoverColor: Colors.blue,
      //   onPressed: () {
      //     Navigator.pushNamed(
      //       context,
      //       Products.pageName,
      //     );
      //   },
      //   tooltip: 'Increment',
      //   child: const Text('Log In'),
      // ),
    );
  }
}



//Body to be returned for Bottom Navigation Package
// Widget getBody(int index){

//   switch (index) {
//     case 0:
//       return  Container(
//           height: 400,
//           width: 400,
//           child: ListView(children: [
//             Text('25'),
//             Text('Other Activity Data'),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, MyApp.pageName,);
//                 //Simple Navigator which doesn't allow random navigation
//                 //Navigator.pop(context);
//               },
//               child: Text('Go Back'),
//             ),
//           ]),
//         );
     
//     case 1: return  Container(
//           height: 400,
//           width: 400,
//           color: Colors.red,
//           child: ListView(children: [
//             Text('25'),
//             Text('Other Activity Data'),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, MyApp.pageName,);
//                 //Simple Navigator which doesn't allow random navigation
//                 //Navigator.pop(context);
//               },
//               child: Text('Go Back'),
//             ),
//           ]),
//         );
//       default:return Container(color: Colors.blue,);  

//   }
// }
// }


//BottomNavigationPackage
// bottomNavigationBar: ConvexAppBar(
//         style: TabStyle.react,
//         items: [
//           TabItem(icon: Icons.list),
//           TabItem(icon: Icons.calendar_today),
//           TabItem(icon: Icons.assessment),
//         ],
//         initialActiveIndex: 1,
//         onTap: (int i) {
//           index=i;
//          setState(() {
           
//          });
//         },
//       ),
//       appBar: AppBar(
//         title: Text('Navigation'),
//       ),
//       body: getBody(index),
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
//           Navigator.pushNamed(context, SecondScreen.pageName,);
//         },
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );  
// }