//
//  ViewController.swift
//  UserNotifi
//
//  Created by J_Min on 2021/09/04.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let notifiCenter = UNUserNotificationCenter.current()
        notifiCenter.requestAuthorization(options: [.alert, .badge, .sound]) { (didAllow, error) in
            print(didAllow)
        }
        notifiCenter.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func moveAddView (_ sender: Any) {
        guard let changeVC = self.storyboard?.instantiateViewController(identifier: "addView") as? AddViewController else { return }
        self.present(changeVC, animated: true, completion: nil)
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.dateLabel.text = String(indexPath.row)
        return cell
    }
}

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
}
