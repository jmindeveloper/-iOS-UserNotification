//
//  ViewController.swift
//  UserNotifi
//
//  Created by J_Min on 2021/09/04.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let notifiCenter = UNUserNotificationCenter.current()
        notifiCenter.requestAuthorization(options: [.alert, .badge, .sound], completionHandler: {didAllow, error in
            print(didAllow)
        })
        notifiCenter.delegate = self
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if notification.request.identifier == "noti" {
            let userInfo = notification.request.content.userInfo
            print(userInfo["name"]!)
        }
        completionHandler([.badge, .list, .banner, .sound])
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        UNUserNotificationCenter.current().getNotificationSettings { (setting) in
            if setting.authorizationStatus == UNAuthorizationStatus.authorized {
                print("동의")
                let content = UNMutableNotificationContent()
                content.badge = 1
                content.title = "title"
                content.subtitle = "subtitle"
                content.body = "body"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                let request = UNNotificationRequest(identifier: "noti", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request)
            } else {
                print("비동의")
            }
        }
    }

}

