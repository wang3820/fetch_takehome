//
//  RecipeViewModel.swift
//  DessertRecipes
//
//  Created by Ray on 6/12/24.
//

import Foundation

@MainActor class RecipeViewModel: ObservableObject {
    @Published var recipe: Recipe?
    
    func fetchData(url: String) async {
        guard let fetchedRecipes: RecipeResponse = await NetworkService(requestUrl: url).retriveData() else {
            return
        }
        recipe = fetchedRecipes.meals[0]
    }
    
    func getIngridientAndMeasures() -> [IngridientItem] {
        var items = [IngridientItem]()
        let ingredients: [String] = recipe?.strIngredients ?? []
        let measures: [String] = recipe?.strMeasures ?? []
        for i in 0..<ingredients.count {
            items.append(IngridientItem(id: i, ingredient: ingredients[i], measure: measures[i]))
        }
    
        return items
    }
    
    func getMealThumb() -> String {
        guard let mealThumb = recipe?.strMealThumb else {
            return ""
        }
        
        return mealThumb
    }
    
    func getMealName() -> String {
        guard let mealName = recipe?.strMeal else {
            return "Unknown"
        }
        
        return mealName
    }
    
    func getMealInstructions() -> String {
        guard let mealInstructions = recipe?.strInstructions else {
            return "Instructions Unavailable"
        }
        
        return mealInstructions
    }
}
