import 'security_scoped_resource_platform_interface.dart';

class SecurityScopedResource {
  Future<String?> getPlatformVersion() {
    return SecurityScopedResourcePlatform.instance.getPlatformVersion();
  }
}
