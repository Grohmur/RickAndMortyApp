//
//  Network.swift
//  RickAndMortyApp
//
//  Created by Михаил Зверьков on 16.01.2022.
//

//import Foundation
//import UIKit
//
//class NetworkingManager {
//    static var shared = NetworkingManager()
//    private init() {}
//
//    func fetchImage(url: String, complition: @escaping(_ image: UIImage) -> Void) {
//        guard let url = URL(string: Link.imageURL.rawValue) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, let response = response else {
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//            guard let image = UIImage(data: data) else { return }
//
//            DispatchQueue.main.async {
//                complition(image)
//            }
//
//        }.resume()
//    }
//
//}
