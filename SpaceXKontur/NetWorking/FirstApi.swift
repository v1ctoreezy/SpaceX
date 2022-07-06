//
//  FirstApi.swift
//  SpaceXKontur
//
//  Created by Виктор Черкасов on 16.06.2022.
//

import Foundation

class NetWorkService {
    func getRockets(completion: @escaping ([Rocket]) -> ()) {
        guard let url = URL(string: "https://api.spacexdata.com/v4/rockets") else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                let rocketsInfo = try JSONDecoder().decode([Rocket].self, from: data!)
                DispatchQueue.main.async {
                    completion(rocketsInfo)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}
