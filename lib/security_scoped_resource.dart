import 'dart:io';

import 'package:flutter/services.dart';

class SecurityScopedResource {
  static const MethodChannel _channel = MethodChannel('security_scoped_resource');

  static final instance = SecurityScopedResource();

  /// Grant access to a directory
  /// Call [stopAccessingSecurityScopedResource] when you're done
  Future<bool> startAccessingSecurityScopedResource(Directory dir) async {
    return await _channel
        .invokeMethod('startAccessingSecurityScopedResource', {'dir': dir.absolute.path});
  }

  /// Frees association with the security scoped resource.
  Future<bool> stopAccessingSecurityScopedResource(Directory dir) async {
    return await _channel
        .invokeMethod('stopAccessingSecurityScopedResource', {'dir': dir.absolute.path});
  }
}
