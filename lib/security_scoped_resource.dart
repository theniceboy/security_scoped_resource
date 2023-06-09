import 'dart:io';

import 'package:flutter/services.dart';

class SecurityScopedResource {
  static const MethodChannel _channel = MethodChannel('security_scoped_resource');

  static final instance = SecurityScopedResource();

  /// Grant access to a directory
  /// Call [stopAccessingSecurityScopedResource] when you're done
  Future<bool> startAccessingSecurityScopedResource(FileSystemEntity entity) async {
    assert(entity is File || entity is Directory, "Entity should be a File or a Directory");
    return await _channel.invokeMethod('startAccessingSecurityScopedResource', {
      'path': entity.absolute.path,
      'isDirectory': entity is Directory,
    });
  }

  /// Frees association with the security scoped resource.
  Future<bool> stopAccessingSecurityScopedResource(FileSystemEntity entity) async {
    assert(entity is File || entity is Directory, "Entity should be a File or a Directory");
    return await _channel.invokeMethod('stopAccessingSecurityScopedResource', {
      'path': entity.absolute.path,
      'isDirectory': entity is Directory,
    });
  }
}
