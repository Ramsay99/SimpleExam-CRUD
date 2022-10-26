import 'package:flutter/material.dart';

Route<dynamic> errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error in Route'),
      ),
      body: const Center(
        child: Text('ERROR!'),
      ),
    );
  });
}
