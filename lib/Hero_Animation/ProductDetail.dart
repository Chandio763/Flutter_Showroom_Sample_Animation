// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import 'ProductModelClass.dart';


class ProductDetail extends StatefulWidget {
  const ProductDetail(this.product, {Key? key}) : super(key: key);
  final Product product;
  static const pageName = 'ProductDetail';

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  Color dataColor = Colors.red.shade900;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    //print(widget.product.description);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.product.name),
        ),
        body: Container(
          height: height,
          width: width,
          child: ListView(
            children: [
              Hero(
                tag: widget.product.imageURl,
                child: Image(
                  image: AssetImage(widget.product.imageURl),
                  height: height * 0.3,
                  width: width,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: height * 0.7,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.product.name,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$ ${widget.product.rent} ',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 35,
                        width: width * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child: Text(
                          ' Key Features',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 18.0,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.car_rental,
                                  color: dataColor,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  widget.product.feature1,
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.settings,
                                  color: dataColor,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  widget.product.feature2,
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: dataColor,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  widget.product.feature3,
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: width*0.4,
                        height: 35,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child: Text(
                          ' Description',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.product.description, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, ),),
                                              
                      ),
                    ],
                    
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          color: Colors.black,
          height: 50,
          width: width*7,
          child: Center(child: Text('Add To Cart', style: TextStyle(color: Colors.white, fontSize: 30,))), ),
        );
  }
}
