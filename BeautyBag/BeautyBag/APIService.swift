//
//  APIService.swift
//  BeautyBag
//
//  Created by Sana Tahir on 11/16/24.
//

import Foundation

class APIService {
    private let session = URLSession.shared
    private let baseURL = "https://sephora.p.rapidapi.com/us/products/v2/detail"
    private let headers = [
        "x-rapidapi-key": "6de6ac746amsh8d043de1b2046a2p10b11ajsn1536fbcfd772",
        "x-rapidapi-host": "sephora.p.rapidapi.com"
    ]

    func fetchProductDetails(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NSError(domain: "Invalid response", code: 500, userInfo: nil)))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 404, userInfo: nil)))
                return
            }

            completion(.success(data))
        }
        task.resume()
    }
}
