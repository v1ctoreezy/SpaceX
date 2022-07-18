////
////  FirstApi.swift
////  SpaceXKontur
////
////  Created by Виктор Черкасов on 16.06.2022.
////
//
//import Foundation
//
//class FirstApi {
//    func getRockets(completion: @escaping ([Rocket]) -> ()) {
//        guard let url = URL(string: "https://api.spacexdata.com/v4/rockets") else {
//            return
//        }
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            do {
//                let rocketsInfo = try JSONDecoder().decode([Rocket].self, from: data!)
//                DispatchQueue.main.async {
//                    completion(rocketsInfo)
//                }
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//        .resume()
//    }
//}

//
//  NetWorkService.swift
//  SpaceXKontur
//
//  Created by Виктор Черкасов on 16.06.2022.
//

import Foundation

class NetWorkService {
    func getData<Type: Codable> (url: String, completion: @escaping ([Type]) -> ()){
        guard let url = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let response = try decoder.decode([Type].self, from: data!)
                DispatchQueue.main.async {
                    completion(response)
                }
            } catch {
                print(error)
            }
        }
        .resume()
    }
    
//    func getData<Type: Codable> (url: String) async throws -> [Type] {
//        let (data, response) = try await URLSession.shared.data(from: URL(string: url)!)
//            guard let httpResponse = response as HTTPURLResponse,
//                  httpResponse.statusCo
//
//        return [Type]
//    }
}

enum APIService {
    static func fetch<T: Decodable>(from url: URL) async throws -> [T] {
        let (todoData, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        let result = try decoder.decode([T].self, from: todoData)
        
        return result
    }
}

