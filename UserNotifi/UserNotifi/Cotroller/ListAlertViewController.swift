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
        if section == 0 {
            return lists.count
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCellSection1 else { return UICollectionViewCell() }
        guard let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as? CollectionViewCellSection2 else { return UICollectionViewCell() }
        
        // cell 1
        cell.cellView.layer.cornerRadius = 20
        cell.layer.shadowRadius = 2
        cell.layer.shadowOpacity = 0.3
        cell.layer.masksToBounds = false
        cell.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        let img = UIImage(systemName: "\(lists[indexPath.row].image)")
        
        cell.date.text = lists[indexPath.row].date
        cell.count.text = String(lists[indexPath.row].count)
        cell.image.image = img
        
        if indexPath.section == 0 {
            return cell
        } else if indexPath.section == 1 {
            return cell2
        } else {
            return UICollectionViewCell()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
}

extension ListAlertViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.bounds.width - (20 * 3)) / 2
        let height: CGFloat = 100
        return CGSize(width: width, height: height)
    }
}

class CollectionViewCellSection1: UICollectionViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var count: UILabel!
    
    
}

class CollectionViewCellSection2: UICollectionViewCell {
    
}

