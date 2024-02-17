//
//  ArtistsViewController.swift
//  ArtGallery
//
//  Created by Kate Kashko on 17.02.2024.
//

import UIKit

final class ArtistsViewController: UITableViewController {
    
    var artists: Gallery?
    private let networkManager = NetworkManager.shared
    private let url = NetworkManager.shared.url
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 160
        fetchArtist()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toworks" {
            guard let worksVC = segue.destination as? WorksViewController else  { return }
            guard let indexPath = tableView.indexPathForSelectedRow else { return}
            let artist = artists?.artists[indexPath.row]
            worksVC.works = artist?.works ?? []
        }
    }
    
}

// MARK: - Table view data source
extension ArtistsViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        artists?.artists.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "artist", for: indexPath)
        guard let cell = cell as? ArtistCell else { return UITableViewCell()}
        let artist = artists?.artists[indexPath.row]
        cell.configure(with: artist!)
        return cell
        
    }
}

extension ArtistsViewController {
    private func fetchArtist() {
        networkManager.fetchArtist(from: url) { [weak self] result in
            switch result {
            case .success(let artists):
                self?.artists = artists
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
