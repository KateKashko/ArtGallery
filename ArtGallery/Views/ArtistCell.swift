//
//  ArtistCell.swift
//  ArtGallery
//
//  Created by Kate Kashko on 17.02.2024.
//

import UIKit

class ArtistCell: UITableViewCell {
    
    @IBOutlet weak var artistImage: UIImageView!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var artistBio: UILabel!
    
    private let networkManager = NetworkManager.shared
    
    func configure(with artist: Artist) {
        artistName.text = artist.name
        artistBio.text = artist.bio
        artistImage.image = UIImage(named: artist.name)
    }
}
