import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:security_scoped_resource/security_scoped_resource.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> pick(BuildContext context) async {
    final path = await FilePicker.platform.getDirectoryPath();
    print(path);
    if (path != null) {
      final dir = Directory(path);
      final r = await SecurityScopedResource.instance.startAccessingSecurityScopedResource(dir);
      print(r);
      dir.listSync();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            TextButton(
              onPressed: () {
                pick(context);
              },
              child: const Text('pick'),
            ),
          ]),
        ),
      ),
    );
  }
}
