// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can
// be found in the LICENSE file.

// Demonstrates a basic shared element (Hero) animation.

import 'package:flutter/material.dart';

class BasicHeroAnimation extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Flippers Page'),
                    ),
                    body: Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.topLeft,
                      // Use background color to emphasize that it's a new route.
                      color: Colors.black,
                      child: Hero(
                        tag: 'flippers',
                        child: SizedBox(
                          width: 100.0,
                          child: Image.asset(
                            'assets/wtmist.png',
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
          // Main route
          child: Hero(
            tag: 'flippers',
            child: Image.asset(
              'assets/wtmist.png',
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: BasicHeroAnimation()));
}