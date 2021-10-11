//OnGenerateRoute Method for generating/handling routes
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'Hero_Animation/MasterDetailImportedCars.dart';
import 'Hero_Animation/MasterDetailNewCars.dart';
import 'Hero_Animation/MasterDetailRentCars.dart';
import 'Hero_Animation/MasterDetailUsedCars.dart';
import 'Hero_Animation/ProductDetail.dart';
import 'Hero_Animation/ProductModelClass.dart';
import 'main.dart';

Route routeConfigration(RouteSettings settings) {
  if (settings.name == NewProducts.pageName) {
    //PageRouteBuilder using Class.
    return PageSlideTransition(NewProducts(), SlidePosition.bottomToTop);
    //Local Page RouteBuilder
    // return PageRouteBuilder(
    //     pageBuilder: (context, animation, secondaryAnimation) =>
    //         const SecondScreen(),
    //     transitionDuration: Duration(seconds: 1),
    //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //       return FadeTransition(
    //         opacity: animation,
    //         child: child,
    //       );
    //     });
  } 

  else if (settings.name == UsedProducts.pageName ) {
    return PageSlideTransition(UsedProducts(), SlidePosition.bottomToTop);
  }

  else if (settings.name == ImportedProducts.pageName ) {
    return PageSlideTransition(ImportedProducts(), SlidePosition.bottomToTop);
  }

  else if (settings.name == Products.pageName) {
    return PageSlideTransition(Products(), SlidePosition.bottomToTop);
  }

  else if (settings.name == ProductDetail.pageName) {
    Product product = settings.arguments as Product;
    return PageSlideTransition(ProductDetail(product), SlidePosition.bottomToTop);
  }
  
  else {
    return PageSlideTransition(MyHomePage(), SlidePosition.bottomToTop);
    // return PageRouteBuilder(
    //   pageBuilder: (context, animation, secondaryAnimation) =>
    //       const MyHomePage(),
    //   transitionsBuilder: (context, animation, secondaryAnimation, child) =>
    //       FadeTransition(
    //     opacity: animation,
    //     child: child,
    //   ),
    //   transitionDuration: const Duration(milliseconds: 500),
    // );
  }
}

class PageRotationTransition extends PageRouteBuilder {
  Widget targetWidget;
  PageRotationTransition(this.targetWidget)
      : super(
          pageBuilder: (context, animation, secondaryAnimation) {
            return targetWidget;
          },
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return RotationTransition(
              turns: animation,
              child: child,
            );
          },
        );
}

enum SlidePosition {
  leftToRight,
  rightToLeft,
  topToBottom,
  bottomToTop,
}

//For Page Navigation using Slide Animation
class PageSlideTransition extends PageRouteBuilder {
  Widget targetWidget;
  PageSlideTransition(this.targetWidget,SlidePosition _position)
      : super(
          pageBuilder: (context, animation, secondaryAnimation) {
            return targetWidget;
          },
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var rightToLeftTween =
                Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
            var leftToRightTween =
                Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0));
            var topToBottomTween =
                Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0));
            var bottomToTopTween =
                Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0));
            switch (_position) {
              case SlidePosition.rightToLeft:
                return SlideTransition(
                  position: rightToLeftTween.animate(animation),
                  child: child,
                );
              case SlidePosition.leftToRight:
                return SlideTransition(
                  position: leftToRightTween.animate(animation),
                  child: child,
                );
              case SlidePosition.topToBottom:
                return SlideTransition(
                  position: topToBottomTween.animate(animation),
                  child: child,
                );
              case SlidePosition.bottomToTop:
                return SlideTransition(
                  position: bottomToTopTween.animate(animation),
                  child: child,
                );
              default:
                {
                  throw 'Unknown Address';
                }
            }
          },
        );
}
