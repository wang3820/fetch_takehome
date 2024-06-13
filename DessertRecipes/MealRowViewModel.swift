//
//  MealRowViewModel.swift
//  DessertRecipes
//
//  Created by Ray on 6/13/24.
//

import Foundation

@MainActor class MealRowViewModel: ObservableObject {
    let meal: Meal
    
    init(meal: Meal) {
        self.meal = meal
    }
    
    func getMealThumb() -> String {
        guard let mealThumb = meal.strMealThumb else {
            return ""
        }
        
        return mealThumb
    }
    
    func getMealName() -> String {
        guard let mealName = meal.strMeal else {
            return "Unknown"
        }
        
        return mealName
    }
}
