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

struct Meal: Codable, Identifiable {
    var id = UUID()
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    
    enum Codingkeys: String, CodingKey {
        case id = "idMeal"
        case strMeal
        case strMealThumb
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        idMeal = try values.decode(String.self, forKey: .idMeal)
        strMeal = try values.decode(String.self, forKey: .strMeal)
        strMealThumb = try values.decode(String.self, forKey: .strMealThumb)

    }
}
