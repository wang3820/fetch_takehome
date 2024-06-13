//
//  NetworkService.swift
//  DessertRecipes
//
//  Created by Ray on 6/12/24.
//

import Foundation

enum FoodDBUrls: String {
    case desserts = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    case mealById = "https://themealdb.com/api/json/v1/1/lookup.php?"
}

enum NetworkError: Error {
    case invalidUrl
    case invalidResponse
    case decodeFailure
}

class NetworkService: Codable {
    private var url: String
    
    init (requestUrl: String) {
        url = requestUrl
    }
    
    
    func retriveData<T: Codable>() async -> T? {
        do {
            guard let requestUrl = URL(string: self.url) else {
                throw NetworkError.invalidUrl
            }
            let (data, response) = try await URLSession.shared.data(from: requestUrl)
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw NetworkError.invalidResponse
            }
            let decoder = JSONDecoder()
            let decodeResult = try? decoder.decode(T.self, from: data)
            
            return decodeResult

        } catch NetworkError.invalidUrl {
            print("Url is invalid")
        } catch NetworkError.invalidResponse {
            print("HTTP resonse is invalid")
            
        } catch NetworkError.decodeFailure{
            print("Failed to decode data")
        } catch {
            print("An error occured while downloading data")
        }
        
        return nil
    }
}

