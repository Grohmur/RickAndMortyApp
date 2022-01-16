//
//  NetworkingManager.swift
//  RickAndMortyApp
//
//  Created by Михаил Зверьков on 16.01.2022.
//

import UIKit

class CharacterCell: UITableViewCell {

    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var characterNameLabel: UILabel!
    @IBOutlet var characterStatusLabel: UILabel!
    
    func configure(with character: Character) {
        characterNameLabel.text = character.name
        characterStatusLabel.text = character.status
        
        DispatchQueue.global().async {
            guard let url = URL(string: character.image ?? "") else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                self.characterImage.image = UIImage(data: imageData)
            }
        }
    }
}
