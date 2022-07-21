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
}

