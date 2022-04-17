//
//  APIService.swift
//  Weather
//
//  Created by balaTTV on 09.04.2022.
//

import Foundation
import Alamofire

struct APIService {
    
    private let baseURL = "https://api.openweathermap.org/data/2.5/onecall?"
    
    func fetchWeatherData(params: Parameters, completion: @escaping (Result<OneCall,NetworkError>)
            -> Void) {
            AF.request(baseURL, parameters: params).responseJSON { response in
                guard let itemsData = response.data else {
                    completion(.failure(.badResponse))
                  return
                }
                do {
                    let decoder = JSONDecoder()
                    let items = try decoder.decode(OneCall.self, from: itemsData)
                        completion(.success(items))
                } catch {
                    completion(.failure(.noData))
                }
            }
        }
          
}
