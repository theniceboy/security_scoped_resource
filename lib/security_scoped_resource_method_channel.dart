import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'security_scoped_resource_platform_interface.dart';

/// An implementation of [SecurityScopedResourcePlatform] that uses method channels.
class MethodChannelSecurityScopedResource extends SecurityScopedResourcePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('security_scoped_resource');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
