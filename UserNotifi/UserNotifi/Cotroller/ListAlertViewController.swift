//
//  ListAlertViewController.swift
//  UserNotifi
//
//  Created by J_Min on 2021/09/10.
//

import UIKit

class ListAlertViewController: UIViewController {
    
    let lists: [CellList] = [
        CellList(date: "오늘", count: 1, image: "calendar"),
        CellList(date: "예정", count: 1, image: "arrow.clockwise"),
        CellList(date: "전체", count: 1, image: "folder"),
        CellList(date: "즐겨찾기", count: 1, image: "star.fill")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension ListAlertViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        cell.cellView.layer.cornerRadius = 20
        cell.layer.shadowRadius = 2
        cell.layer.shadowOpacity = 0.3
        cell.layer.masksToBounds = false
        cell.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        let img = UIImage(systemName: "\(lists[indexPath.row].image)")
        
//        cell.image = UIImage(named: "\(lists[indexPath.row])")
        cell.date.text = lists[indexPath.row].date
        cell.count.text = String(lists[indexPath.row].count)
        cell.image.image = img
        
        return cell
    }
    
}

extension ListAlertViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.bounds.width - (20 * 3)) / 2
        let height: CGFloat = width - 80
        return CGSize(width: width, height: height)
    }
}

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var count: UILabel!
    
    
    
}

