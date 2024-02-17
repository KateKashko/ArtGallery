//
//  WorksCell.swift
//  ArtGallery
//
//  Created by Kate Kashko on 17.02.2024.
//

import UIKit

class WorksCell: UICollectionViewCell{
    
    @IBOutlet weak var worksImage: UIImageView!
    @IBOutlet weak var worksTitle: UILabel!
    
    func configure(with works: Work) {
        worksTitle.text = works.title
        worksImage.image = UIImage(named: works.title)
    }
}
