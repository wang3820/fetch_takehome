//
//  Recipe.swift
//  DessertRecipes
//
//  Created by Ray on 6/12/24.
//

import Foundation

struct RecipeResponse: Codable {
    let meals: [Recipe]
}

struct CustomCodingKeys: CodingKey {
    var stringValue: String
    init?(stringValue: String) { self.stringValue = stringValue }
    var intValue: Int?
    init?(intValue: Int) { return nil }
}

struct IngridientItem: Identifiable {
    var id: Int
    let ingredient: String
    let measure: String
}

struct Recipe: Codable {
    let idMeal: String
    let strMeal: String
    let strInstructions: String
    let strMealThumb: String
    let strIngredients: [String]
    let strMeasures: [String]
    
    init(from decoder: Decoder) throws {
        var ingredients = [String]()
        var measures = [String]()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        idMeal = try values.decode(String.self, forKey: .idMeal)
        strMeal = try values.decode(String.self, forKey: .strMeal)
        strInstructions = try values.decode(String.self, forKey: .strInstructions)
        strMealThumb = try values.decode(String.self, forKey: .strMealThumb)
    
        let listValues = try decoder.container(keyedBy: CustomCodingKeys.self)
        for i in 1... {
            if let ingredientKey = CustomCodingKeys(stringValue: "strIngredient\(i)"),
               let ingredient = try listValues.decodeIfPresent(String.self, forKey: ingredientKey),
               !ingredient.isEmpty {
                ingredients.append(ingredient)
            } else {
                break
            }
            
            if let measureKey = CustomCodingKeys(stringValue: "strMeasure\(i)"),
               let measure = try listValues.decodeIfPresent(String.self, forKey: measureKey),
               !measure.isEmpty {
                measures.append(measure)
            }
        }
        
        strIngredients = ingredients
        strMeasures = measures
    
    }
}
