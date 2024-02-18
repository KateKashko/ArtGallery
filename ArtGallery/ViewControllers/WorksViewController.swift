//
//  WorksViewController.swift
//  ArtGallery
//
//  Created by Kate Kashko on 17.02.2024.
//

import UIKit

class WorksViewController: UICollectionViewController {
    
    var works = [Work]()
    let itemsPerRow: CGFloat = 2
    let sectionInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    var selectedRow: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.allowsSelection = true
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return works.count
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "works", for: indexPath)
        guard let cell = cell as? WorksCell else { return UICollectionViewCell() }
        let work = works[indexPath.item]
        cell.configure(with: work)
        cell.delegate = self
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // not triggering from the collection view, used worksCellDelegate instead
    }
}

// MARK: WorksCellDelegate
extension WorksViewController: WorksCellDelegate {
    func didTapCell(with item: Work) {
        guard let vc = storyboard?.instantiateViewController(identifier: "WorkDetailsViewController") as? WorkDetailsViewController else { return }
        vc.work = item
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

//MARK: FlowLayuot
extension WorksViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingWidth = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
