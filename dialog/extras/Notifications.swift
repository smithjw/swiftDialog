//
//  Notifications.swift
//  dialog
//
//  Created by Bart Reardon on 25/10/21.
//

import Foundation
import UserNotifications
import AppKit

func requestNotificationAuth() {
    // request notification permission
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
        if success {
            print("All set!")
        } else if let error = error {
            print(error.localizedDescription)
        }
    }
}


func sendNotification() {
    
    requestNotificationAuth()
    
    let content = UNMutableNotificationContent()
    
    let acceptAction = UNNotificationAction(identifier: "ACCEPT_ACTION",
                                            title: cloptions.button1TextOption.value,
                                            options: [.foreground])
    let declineAction = UNNotificationAction(identifier: "DECLINE_ACTION",
                                             title: cloptions.button2TextOption.value,
                                             options: [.foreground])
    // Define the notification type
    let notificationCategory =
          UNNotificationCategory(identifier: "DialogNotification",
          actions: [acceptAction, declineAction],
          intentIdentifiers: [],
          hiddenPreviewsBodyPlaceholder: "",
          options: .customDismissAction)
    
    let nTitle : String = cloptions.titleOption.value
    let nSubTitle : String = ""
    let nBody : String = cloptions.messageOption.value
    //let nIcon : Image = Image(nsImage: getAppIcon(appPath: cloptions.iconOption.value))
    let imageName = "cloptions.iconOption.value"
            let imageURL = URL(fileURLWithPath: cloptions.iconOption.value)// else { return }
            let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
    
    content.attachments = [attachment]
        
    content.title = nTitle
    content.subtitle = nSubTitle
    content.body = nBody
    content.attachments = [attachment]
    content.sound = UNNotificationSound.default
    //content.userInfo = ["DIALOG_ID" : "123", "USER_ID" : "1" ]
    content.categoryIdentifier = "DialogNotification"
    
    // show this notification five seconds from now
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)

    // choose a random identifier
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    
    //let category = UNNotificationCategory(identifier: "DialogNotification", actions: [acceptAction,declineAction], intentIdentifiers:[], options: [])

    // add our notification request
    let notificationCenter = UNUserNotificationCenter.current()
    
    notificationCenter.setNotificationCategories([notificationCategory])
    notificationCenter.add(request)

}

//extension AppDelegate: UNUserNotificationCenterDelegate {
    
//}

extension UNNotificationResponse {
    //@available(macOS 11, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "NewNotification") , object: nil, userInfo: response.notification.request.content.userInfo)
        processNotification(forResponse: response)
    }
}

//@available(macOS 11, *)
func processNotification(forResponse response: UNNotificationResponse) {
    if response.notification.request.content.categoryIdentifier == "DialogNotification" {
        switch response.actionIdentifier {
        case "ACCEPT_ACTION" :
            test()
            break
        case "DECLINE_ACTION" :
            break
        default:
            break
        }
        
    }
}


func test() {
    print("testing")
}


