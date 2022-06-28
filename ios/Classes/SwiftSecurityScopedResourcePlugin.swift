import Flutter
import UIKit

public class SwiftSecurityScopedResourcePlugin: NSObject, FlutterPlugin, UIDocumentPickerDelegate {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "security_scoped_resource", binaryMessenger: registrar.messenger())
        let instance = SwiftSecurityScopedResourcePlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let args = call.arguments as? Dictionary<String, Any> else {
            result(FlutterError(code: "InvalidArguments", message: "Arguments needs to be a dictionary", details: nil))
            return
        }
        
        switch call.method {
        case "startAccessingSecurityScopedResource":
            guard let dir = args["dir"] as? String else {
                result(FlutterError(code: "InvalidArguments", message: "argument 'dir' is not a Stirng", details: nil))
                return
            }
            let url = URL(fileURLWithPath: dir, isDirectory: true)
            result(url.startAccessingSecurityScopedResource())
        case "stopAccessingSecurityScopedResource":
            guard let dir = args["dir"] as? String else {
                result(FlutterError(code: "InvalidArguments", message: "argument 'dir' is not a Stirng", details: nil))
                return
            }
            let url = URL(fileURLWithPath: dir, isDirectory: true)
            url.stopAccessingSecurityScopedResource()
            result(true)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
