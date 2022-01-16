//
//  MainTableViewController.swift
//  RickAndMortyApp
//
//  Created by Михаил Зверьков on 16.01.2022.
//

import UIKit

class MainTableViewController: UITableViewController {

    private var characters: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        fetchCharacters()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharacterCell
        
        let character = characters
        cell.configure(with: character!)

        return cell
    }
}

extension MainTableViewController {
    func fetchCharacters() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/2") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                self.characters = try JSONDecoder().decode(Character.self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }

        }.resume()
    }
}
