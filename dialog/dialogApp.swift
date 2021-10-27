//
//  dialogApp.swift
//  dialog
//
//  Created by Bart Reardon on 9/3/21.
//

import SwiftUI
import UserNotifications
import SystemConfiguration


extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

@available(OSX 11.0, *)
@main
struct dialogApp: App {
    
        
    init () {
        
        // get all the command line option values
        processCLOptionValues()
        
        // check for jamfhelper mode
        if cloptions.jamfHelperMode.present {
            print("converting jh to dialog")
            convertFromJamfHelperSyntax()
        }
        
        // process remaining command line options
        processCLOptions()
                        
        appvars.overlayShadow = 1
                
        appvars.titleHeight = appvars.titleHeight * appvars.scaleFactor
        appvars.windowWidth = appvars.windowWidth * appvars.scaleFactor
        appvars.windowHeight = appvars.windowHeight * appvars.scaleFactor
        appvars.iconWidth = appvars.iconWidth * appvars.scaleFactor
        appvars.iconHeight = appvars.iconHeight * appvars.scaleFactor
        
        if cloptions.fullScreenWindow.present {
            FullscreenView().showFullScreen()
        }
        
        //check debug mode and print info
        if cloptions.debug.present {
            appvars.debugMode = true
            appvars.debugBorderColour = Color.green
            
            print("Window Height = \(appvars.windowHeight): Window Width = \(appvars.windowWidth)")
            
            print("\nApplication State Variables")
            let mirrored_appvars = Mirror(reflecting: appvars)
            for (_, attr) in mirrored_appvars.children.enumerated() {
                if let propertyName = attr.label as String? {
                print("  \(propertyName) = \(attr.value)")
              }
            }
            print("\nApplication Command Line Options")
            let mirrored_cloptions = Mirror(reflecting: cloptions)
            for (_, attr) in mirrored_cloptions.children.enumerated() {
                if let propertyName = attr.label as String? {
                print("  \(propertyName) = \(attr.value)")
              }
            }
            
            // print appvariables and options if debug mode is on
            //print("CLOPTIONS")
            //print(cloptions)
            //print("APPVARS")
            //print(appvars)
        }
        //NSLog("Dialog: Notification Start")
        if cloptions.sendAsNotification.present {
            //if let response = (aNotification as NSNotification).userInfo?[NSApplication.launchUserNotificationUserInfoKey] as? UNNotificationResponse {
            //    handleUNNotification(forResponse: response)
            //}
            sendNotification()
            //quitDialog(exitCode: 11)
        }
        
    }
    var body: some Scene {

        WindowGroup {
            if !cloptions.sendAsNotification.present {
                ContentView()
                    .frame(width: appvars.windowWidth, height: appvars.windowHeight) // + appvars.bannerHeight)
                    //.frame(idealWidth: appvars.windowWidth, idealHeight: appvars.windowHeight)
            }
        }
        // Hide Title Bar
        .windowStyle(HiddenTitleBarWindowStyle())
    }
    /*
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NewNotification") , object: nil, userInfo: response.notification.request.content.userInfo)
        processNotification(forResponse: response)
    }
     */
}


