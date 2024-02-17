//
//  Artist.swift
//  ArtGallery
//
//  Created by Kate Kashko on 17.02.2024.
//

import Foundation

struct Gallery: Decodable {
    let artists: [Artist]
}

struct Artist: Decodable {
    let name: String
    let bio: String
    let image: String
    let works: [Work]
}

struct Work: Decodable {
    let title: String
    let image: String
    let info: String
}
