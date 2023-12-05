// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GiveOrTakeSip extends StatelessWidget {
  bool give;
  GiveOrTakeSip({super.key, required this.give});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                      child: give
                          ? Text(
                              "Give ${Random().nextInt(3) + 2} sips",
                              style: TextStyle(fontSize: 50),
                              textAlign: TextAlign.center,
                            )
                          : Text(
                              "Take ${Random().nextInt(3) + 2} sips",
                              style: TextStyle(fontSize: 50),
                              textAlign: TextAlign.center,
                            )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}