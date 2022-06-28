import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'security_scoped_resource_method_channel.dart';

abstract class SecurityScopedResourcePlatform extends PlatformInterface {
  /// Constructs a SecurityScopedResourcePlatform.
  SecurityScopedResourcePlatform() : super(token: _token);

  static final Object _token = Object();

  static SecurityScopedResourcePlatform _instance = MethodChannelSecurityScopedResource();

  /// The default instance of [SecurityScopedResourcePlatform] to use.
  ///
  /// Defaults to [MethodChannelSecurityScopedResource].
  static SecurityScopedResourcePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SecurityScopedResourcePlatform] when
  /// they register themselves.
  static set instance(SecurityScopedResourcePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
