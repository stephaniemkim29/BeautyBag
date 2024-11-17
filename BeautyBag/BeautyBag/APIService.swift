//
//  APIService.swift
//  BeautyBag
//
//  Created by Sana Tahir on 11/16/24.
//
//
//import Foundation
//
//class APIService {
//    private let session = URLSession.shared
//    private let baseURL = "https://sephora.p.rapidapi.com/us/products/v2/detail"
//    private let headers = [
//        "x-rapidapi-key": "6de6ac746amsh8d043de1b2046a2p10b11ajsn1536fbcfd772",
//        "x-rapidapi-host": "sephora.p.rapidapi.com"
//    ]
//
//    func fetchProductDetails(completion: @escaping (Result<Data, Error>) -> Void) {
//        guard let url = URL(string: baseURL) else {
//            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = headers
//
//        let task = session.dataTask(with: request) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//
//            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
//                completion(.failure(NSError(domain: "Invalid response", code: 500, userInfo: nil)))
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(NSError(domain: "No data", code: 404, userInfo: nil)))
//                return
//            }
//
//            completion(.success(data))
//        }
//        task.resume()
//    }
//}
import Foundation

struct Products {
    let brandName: String
    let productName: String
}

class SephoraAPIService {
    private let apiKey = "6de6ac746amsh8d043de1b2046a2p10b11ajsn1536fbcfd772"
    private let apiHost = "sephora.p.rapidapi.com"
    private let baseURL = "https://sephora.p.rapidapi.com/auto-complete"
    
    func fetchProducts(query: String, completion: @escaping ([Products]?, Error?) -> Void) {
        guard let url = URL(string: "\(baseURL)?q=\(query)") else {
            completion(nil, NSError(domain: "Invalid URL", code: -1, userInfo: nil))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(apiKey, forHTTPHeaderField: "x-rapidapi-key")
        request.addValue(apiHost, forHTTPHeaderField: "x-rapidapi-host")
        
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "No data", code: -2, userInfo: nil))
                return
            }
            
            do {
                // Parse JSON
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let terms = json["typeAheadTerms"] as? [[String: Any]] {
                    let products = terms.compactMap { term -> Products? in
                        guard let brandName = term["brandName"] as? String,
                              let productName = term["productName"] as? String else {
                            return nil
                        }
                        return Products(brandName: brandName, productName: productName)
                    }
                    completion(products, nil)
                } else {
                    completion(nil, NSError(domain: "Invalid JSON", code: -3, userInfo: nil))
                }
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}
