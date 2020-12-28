//
//  ViewController.swift
//  TestLocalNotification
//
//  Created by Lin Cui on 2020-12-27.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //reference to notification center
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }
        
        //create notification content
        let content = UNMutableNotificationContent()
        content.title = "Hello world"
        content.body = "You are the best!"
        
        // create trigger
        let date = Date().addingTimeInterval(10)
        
        let dateComponents = Calendar.current.dateComponents( [.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        //create request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        //register with notification center
        center.add(request) { (error) in
            print(error ?? "not found error")
        }
    }


}

