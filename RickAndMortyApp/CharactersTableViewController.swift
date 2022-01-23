//
//  CharactersTableViewController.swift
//  RickAndMortyApp
//
//  Created by Михаил Зверьков on 22.01.2022.
//

import UIKit

class CharactersTableViewController: UITableViewController {
    
    private var characters: [Character] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 70
        tableView.backgroundColor = .black
        fetchData(from: "https://rickandmortyapi.com/api/character/?page=2")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let character = characters[indexPath.row]
            var content = cell.defaultContentConfiguration()
            content.text = character.name
            content.secondaryText = character.type
            DispatchQueue.global().async {
                guard let stringUrl = character.image else { return }
                guard let imageUrl = URL(string: stringUrl) else { return }
                guard let imageData = try? Data(contentsOf: imageUrl) else { return }
                DispatchQueue.main.async {
                    content.image = UIImage(data: imageData)
                }
            }
        return cell
    }
    
    private func fetchData(from url: String?) {
        NetworkingManager.shared.fetchData(from: url) { JSON in
            guard let persons = JSON.results else { return }
            self.characters = persons
            self.tableView.reloadData()
        }
    }


}

