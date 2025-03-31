import UIKit
import Flutter
import SwiftUI

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller = window?.rootViewController as! FlutterViewController

        let flutterChannel = FlutterMethodChannel(name: "com.example/homeView",
                                                  binaryMessenger: controller.binaryMessenger)

        flutterChannel.setMethodCallHandler { [weak self] (call, result) in
            if call.method == "openHomeView" {
                self?.openHomeView()
                result("Home View Opened")
            } else {
                result(FlutterMethodNotImplemented)
            }
        }

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    private func openHomeView() {
        DispatchQueue.main.async {
            let homeView = HomeView()
            let hostingController = UIHostingController(rootView: homeView)
            hostingController.modalPresentationStyle = .fullScreen
            
            // Present the SwiftUI view
            if let rootViewController = self.window?.rootViewController {
                rootViewController.present(hostingController, animated: true, completion: nil)
            }
        }
    }
}
