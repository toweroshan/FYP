import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class XDiPhone678Plus1 extends StatelessWidget {
  XDiPhone678Plus1({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Container(
            width: 414.0,
            height: 736.0,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              border: Border.all(width: 1.0, color: const Color(0xff707070)),
            ),
          ),
          Transform.translate(
            offset: Offset(66.0, 10.0),
            child: Text(
              'Tap & Trade',
              style: TextStyle(
                fontFamily: 'Segoe Print',
                fontSize: 40,

                color: const Color(0xff2900ff),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(30.0, 106.0),
            child: Container(
              width: 200.0,
              height: 51.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff000000)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(246.0, 106.0),
            child:
                // Adobe XD layer: 'search' (group)
                SizedBox(
              width: 157.0,
              height: 51.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 157.0, 51.0),
                    size: Size(157.0, 51.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.0),
                        color: const Color(0xf55142),
                        border: Border.all(
                            width: 1.0, color: const Color(0xff000000)),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(33.0, 2.0, 84.0, 43.0),
                    size: Size(157.0, 51.0),
                    pinTop: true,
                    pinBottom: true,
                    fixedWidth: true,
                    child: Text(
                      'Search',
                      style: TextStyle(
                        fontFamily: 'Segoe Print',
                        fontSize: 25,
                        color: const Color(0xff2900ff),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(58.0, 108.0),
            child: Text(
              '----------',
              style: TextStyle(
                fontFamily: 'Segoe Print',
                fontSize: 25,
                color: const Color(0xff2900ff),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(30.0, 202.0),
            child:
                // Adobe XD layer: 'rgster' (group)
                SizedBox(
              width: 116.0,
              height: 30.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 116.0, 30.0),
                    size: Size(116.0, 30.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.0),
                        color: const Color(0xffffffff),
                        border: Border.all(
                            width: 1.0, color: const Color(0xff000000)),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(28.0, 0.0, 61.0, 26.0),
                    size: Size(116.0, 30.0),
                    pinTop: true,
                    pinBottom: true,
                    fixedWidth: true,
                    child: Text(
                      'Register',

                      style: TextStyle(
                        fontFamily: 'Segoe Print',
                        fontSize: 15,
                        color: const Color(0xff2900ff),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(178.0, 202.0),
            child:
                // Adobe XD layer: 'signup' (group)
                SizedBox(
              width: 116.0,
              height: 30.0,
              child: Stack(
                children: <Widget>[
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(0.0, 0.0, 116.0, 30.0),
                    size: Size(116.0, 30.0),
                    pinLeft: true,
                    pinRight: true,
                    pinTop: true,
                    pinBottom: true,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21.0),
                        color: const Color(0xffffffff),
                        border: Border.all(
                            width: 1.0, color: const Color(0xff000000)),
                      ),
                    ),
                  ),
                  Pinned.fromSize(
                    bounds: Rect.fromLTWH(28.0, 0.0, 57.0, 26.0),
                    size: Size(116.0, 30.0),
                    pinTop: true,
                    pinBottom: true,
                    fixedWidth: true,
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontFamily: 'Segoe Print',
                        fontSize: 15,
                        color: const Color(0xff2900ff),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
