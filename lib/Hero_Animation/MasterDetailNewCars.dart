// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'ProductDetail.dart';
import 'ProductModelClass.dart';

class NewProducts extends StatefulWidget {
  const NewProducts({Key? key}) : super(key: key);
  static const pageName = 'New Products';
  @override
  _NewProductsState createState() => _NewProductsState();
}

class _NewProductsState extends State<NewProducts> {
  var productList = [
    Product(
      name: 'Ford KA ',
      imageURl: 'assets/car1.png',
      rent: '5000000',
      feature1: 'Luxury',
      feature2: 'Automatic',
      feature3: 'Yes',
      description: 'A car (or automobile) is a wheeled motor vehicle used for transportation. Most definitions of cars say that they run primarily on roads, seat one-to-eight people, have four wheels and mainly transport people rather than goods. Cars have controls for driving, parking, passenger comfort, and a variety of lights.',
    ),
    Product(
      name: 'BMW 4 Series',
      imageURl: 'assets/car2.png',
      rent: '42822000',
      feature1: 'Luxury',
      feature2: 'Automatic',
      feature3: 'No',
      description: 'A car (or automobile) is a wheeled motor vehicle used for transportation. Most definitions of cars say that they run primarily on roads, seat one-to-eight people, have four wheels and mainly transport people rather than goods. Cars have controls for driving, parking, passenger comfort, and a variety of lights.',
    ),
    Product(
      name: 'Ford',
      imageURl: 'assets/car3.png',
      rent: '25204000',
      feature1: 'Mini',
      feature2: 'Manual',
      feature3: 'Yes',
      description: 'A car (or automobile) is a wheeled motor vehicle used for transportation. Most definitions of cars say that they run primarily on roads, seat one-to-eight people, have four wheels and mainly transport people rather than goods. Cars have controls for driving, parking, passenger comfort, and a variety of lights.',
    ),
    Product(
      name: 'Ford KA',
      imageURl: 'assets/car4.png',
      rent: '35973000',
      feature1: 'Luxury',
      feature2: 'Automatic',
      feature3: 'No',
      description: 'A car (or automobile) is a wheeled motor vehicle used for transportation. Most definitions of cars say that they run primarily on roads, seat one-to-eight people, have four wheels and mainly transport people rather than goods. Cars have controls for driving, parking, passenger comfort, and a variety of lights.',
    ),
    Product(
      name: 'BMW 5 Series',
      imageURl: 'assets/car5.png',
      rent: '27250000',
      feature1: 'Luxury',
      feature2: 'Automatic',
      feature3: 'Yes',
      description: 'A car (or automobile) is a wheeled motor vehicle used for transportation. Most definitions of cars say that they run primarily on roads, seat one-to-eight people, have four wheels and mainly transport people rather than goods. Cars have controls for driving, parking, passenger comfort, and a variety of lights.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Browse Product'),
        actions: const [Icon(Icons.search)],
        elevation: 10,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Container(
            height: 10,
            width: width,
            color: Colors.grey.shade300,
          );
        },
        itemCount: productList.length,
        //itemExtent: 100,
        itemBuilder: (context, index) {
          return SizedBox(
            width: width,
            height: 180,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          productList[index].name,
                          style: TextStyle(
                              color: Colors.blue.shade700,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${productList[index].rent} /day',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                width: 1, color: Colors.grey.shade600)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: GestureDetector(
                                onTap: () {
                                  //Navigate to Detail Page
                                  Navigator.push(context, MaterialPageRoute(builder:(context) {
                                    return ProductDetail(productList[index]);
                                  },));
                                },
                                child: Hero(
                                  tag: productList[index].imageURl,
                                  child: Image.asset(
                                    productList[index].imageURl,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.car_rental,
                                            color: Colors.blue,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            productList[index].feature1,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.settings,
                                              color: Colors.blue,
                                              size: 30,
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              productList[index].feature2,
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ],
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.person,
                                              color: Colors.blue,
                                              size: 30,
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              productList[index].feature3,
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
