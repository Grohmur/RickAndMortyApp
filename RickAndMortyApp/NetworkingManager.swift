//
//  Network.swift
//  RickAndMortyApp
//
//  Created by Михаил Зверьков on 16.01.2022.
//

import Foundation
import UIKit


class NetworkingManager {
    static var shared = NetworkingManager()
    private init() {}

    func fetchData(from url: String?, with completion: @escaping(MainJSON) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let rickAndMorty = try JSONDecoder().decode(MainJSON.self, from: data)
                DispatchQueue.main.async {
                    completion(rickAndMorty)
                }
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
}
