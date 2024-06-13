//
//  Meal.swift
//  DessertRecipes
//
//  Created by Ray on 6/12/24.
//

import Foundation

struct MealResponse: Codable {
    let meals: [Meal]
}

extension String {
    func emptyAsNil() -> String? {
        self.isEmpty ? nil : self
    }
}

struct Meal: Codable, Identifiable {
    var id = UUID()
    let idMeal: String
    let strMeal: String?
    let strMealThumb: String?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        idMeal = try values.decode(String.self, forKey: .idMeal)
        strMeal = try values.decodeIfPresent(String.self, forKey: .strMeal)?.emptyAsNil()
        strMealThumb = try values.decodeIfPresent(String.self, forKey: .strMealThumb)?.emptyAsNil()

    }
}
