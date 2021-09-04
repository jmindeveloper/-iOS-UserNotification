//
//  addViewController.swift
//  UserNotifi
//
//  Created by J_Min on 2021/09/04.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var textField: UITextField!
    var id = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func addNotification(date: String, body: String, time: TimeInterval, id: String) {
        UNUserNotificationCenter.current().getNotificationSettings { setting in
            if setting.authorizationStatus == UNAuthorizationStatus.authorized {
                print("동의")
                let content = UNMutableNotificationContent()
                content.badge = 1
                content.title = "title"
                content.subtitle = date
                content.body = body
                content.sound = UNNotificationSound.default
                
                let time = time
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
                let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            }
        }
    }
    @IBAction func addNoti(_ sender: Any) {
        let message = textField.text ?? ""
        let interval = self.datePicker.date.timeIntervalSinceNow
        
        id += 1
        let idStr = String(id)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
        let pickerDate = formatter.string(from: datePicker.date)
        let currentDate = formatter.string(from: Date())
        print("pickerDate --> \(pickerDate)")
        print("currentDate --> \(currentDate)")
        
        if pickerDate > currentDate {
            let alert = UIAlertController(title: "알림추가", message: "\(pickerDate)에 알림을 추가히시겠습니까?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
            let okAction = UIAlertAction(title: "확인", style: .default) { _ in
                let alert = UIAlertController(title: nil, message: "알림이 등록됐습니다", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
            alert.addAction(cancelAction)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            
            addNotification(date: pickerDate, body: message, time: interval, id: idStr)
        } else {
            let alert = UIAlertController(title: "경고", message: "현재시간 이전의 시간은 설정이 불가능합니다", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
