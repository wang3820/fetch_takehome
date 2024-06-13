//
//  MealsViewModel.swift
//  DessertRecipes
//
//  Created by Ray on 6/12/24.
//


import Foundation

@MainActor class MealsViewModel: ObservableObject {
    @Published var meals = [Meal]()
    
    func fetchData(url: String) async {
        guard let fetchedMeals: MealResponse = await NetworkService(requestUrl: url).retriveData() else {
            return
        }
        meals = fetchedMeals.meals
    }
}
