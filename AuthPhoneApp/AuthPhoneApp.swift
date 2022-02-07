//
//  RodnikAppApp.swift
//  RodnikApp
//
//  Created by igor mekkers on 31.01.2022.
//

import SwiftUI
import Firebase

@main
struct AuthPhoneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// intializing Firebase

class AppDelegate: NSObject,UIApplicationDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool{
       
        FirebaseApp.configure()
        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification
                     userInfo: [AnyHashable : Any], fetchCompletionHandler
                     completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {

    }
}
