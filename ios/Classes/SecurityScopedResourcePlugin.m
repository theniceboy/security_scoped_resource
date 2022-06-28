#import "SecurityScopedResourcePlugin.h"
#if __has_include(<security_scoped_resource/security_scoped_resource-Swift.h>)
#import <security_scoped_resource/security_scoped_resource-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "security_scoped_resource-Swift.h"
#endif

@implementation SecurityScopedResourcePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSecurityScopedResourcePlugin registerWithRegistrar:registrar];
}
@end
