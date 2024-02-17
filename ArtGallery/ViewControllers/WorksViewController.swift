//
//  WorksViewController.swift
//  ArtGallery
//
//  Created by Kate Kashko on 17.02.2024.
//

import UIKit

class WorksViewController: UICollectionViewController {
    
    var works = [Work]()
    let itemsPerRow: CGFloat = 2 //кол-во картинок по ширине
    let sectionInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return works.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "works", for: indexPath)
        guard let cell = cell as? WorksCell else { return UICollectionViewCell() }
//        cell.worksImage.image = works[indexPath.item].image
//        cell.configure(with: cell)
        let work = works[indexPath.item]
        cell.configure(with: work)
        return cell

    }
}

extension WorksViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingWidth = sectionInsets.left * (itemsPerRow + 1) //общая величина всех отступов по ширине
        let availableWidth = collectionView.frame.width - paddingWidth //доступна ширина для размещения картинок
        let widthPerItem = availableWidth / itemsPerRow //точная доступная ширина для одной картинки
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets //отступы всей коллекции
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left // отступ между картинками по высоте
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left // отступ между картинками по ширине
    }
}
