import Flutter
import UIKit

public class SwiftSecurityScopedResourcePlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "security_scoped_resource", binaryMessenger: registrar.messenger())
        let instance = SwiftSecurityScopedResourcePlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result("iOS " + UIDevice.current.systemVersion)
    }
}
