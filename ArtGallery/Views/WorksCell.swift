//
//  WorksCell.swift
//  ArtGallery
//
//  Created by Kate Kashko on 17.02.2024.
//

import UIKit

protocol WorksCellDelegate: AnyObject {
    func didTapCell(with item: Work)
}

class WorksCell: UICollectionViewCell{
    weak var delegate: WorksCellDelegate?
    
    @IBOutlet weak var worksImage: UIImageView!
    @IBOutlet weak var worksTitle: UILabel!
    
    var workItem: Work?
    
    func configure(
        with works: Work
    ) {
        workItem = works
        worksTitle.text = works.title
        worksImage.image = UIImage(named: works.title)
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
    }
    
    @objc func tap() {
        if let work = workItem {
            delegate?.didTapCell(with: work)
        }
    }
}
