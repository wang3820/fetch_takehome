//
//  MealsViewModel.swift
//  DessertRecipes
//
//  Created by Ray on 6/12/24.
//


import Foundation

extension Meal: Comparable {
    static func == (lhs: Meal, rhs: Meal) -> Bool {
        if let leftName = lhs.strMeal, let rightName = rhs.strMeal {
            return leftName == rightName
        }
        else {
            guard lhs.strMeal != nil else {
                guard rhs.strMeal != nil else {
                    return true
                }
                return false
            }
        }
        
        return true
    }
    
    static func < (lhs: Meal, rhs: Meal) -> Bool {
        if let leftName = lhs.strMeal, let rightName = rhs.strMeal {
            return leftName < rightName
        }
        else {
            guard lhs.strMeal != nil else {
                guard rhs.strMeal != nil else {
                    return true
                }
                return false
            }
        }
        
        return true
    }
}

@MainActor class MealsViewModel: ObservableObject {
    @Published var meals = [Meal]()
    
    func fetchData(url: String) async {
        guard let fetchedMeals: MealResponse = await NetworkService(requestUrl: url).retriveData() else {
            return
        }
        meals = fetchedMeals.meals.sorted(by: <)
    }
    
    func mealIsValid(meal: Meal) -> Bool {
        guard meal.strMeal != nil else {
            return false
        }
        
        return true
        
    }
}
