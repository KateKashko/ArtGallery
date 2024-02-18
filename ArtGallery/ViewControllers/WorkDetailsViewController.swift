//
//  WorkDetailsViewController.swift
//  ArtGallery
//
//  Created by Kate Kashko on 17.02.2024.
//

import UIKit

class WorkDetailsViewController: UIViewController {

    @IBOutlet weak var workTitle: UILabel!
    @IBOutlet weak var workImage: UIImageView!
    @IBOutlet weak var workInfo: UILabel!
    
    var work: Work?
    
    func configure(with work: Work) {
        workTitle.text = work.title
        workInfo.text = work.info
        workImage.image = UIImage(named: work.title)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let work = work {
            configure(with: work)
        }
    }
}
