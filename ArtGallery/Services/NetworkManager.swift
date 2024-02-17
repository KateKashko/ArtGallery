//
//  NetworkManager.swift
//  ArtGallery
//
//  Created by Kate Kashko on 17.02.2024.
//

import Foundation

enum NetworkError: Error {
    case noData
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    let url = URL(string: "https://file.notion.so/f/f/b8bbfa88-ab7c-464e-8c0e-1c109af93066/8c0c0258-c23a-4229-ae76-b515867cc1d8/artists.json?id=65f3a8fb-a15e-48f4-a7ed-f75be1b2f4fb&table=block&spaceId=b8bbfa88-ab7c-464e-8c0e-1c109af93066&expirationTimestamp=1708228800000&signature=5hy_26eHF9TUrlbLxh1urj8zKsdbIqLJpmXAjMVLP54&downloadName=artists.json")!
    
    private init() {}
    
    func fetchArtist(from url: URL, completion: @escaping(Result<Gallery, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let decoder = JSONDecoder()
                let newArtist = try decoder.decode(Gallery.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(newArtist))
                }
            } catch  {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
