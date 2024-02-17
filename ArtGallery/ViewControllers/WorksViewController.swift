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

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toWorkDetails" {
            guard let workDetailsVC = segue.destination as? WorkDetailsViewController else { return }
            guard let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
            let work = works[indexPath.item]
            workDetailsVC.workInfo.text = work.info
            workDetailsVC.workImage.image = UIImage(named: work.title)
            workDetailsVC.workTitle.text = work.title
        } else {
            print("сука сегвей")
        }
    }


    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return works.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "works", for: indexPath)
        guard let cell = cell as? WorksCell else { return UICollectionViewCell() }
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
