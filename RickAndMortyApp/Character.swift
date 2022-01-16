//
//  Character.swift
//  RickAndMortyApp
//
//  Created by Михаил Зверьков on 16.01.2022.
//

import Foundation



struct Character: Decodable {
    let name: String?
    let status: String?
    let species: String?
    let gender: String?
    let type: String?
    let image: String?
}
