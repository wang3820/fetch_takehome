//
//  ContentView.swift
//  DessertRecipes
//
//  Created by Ray on 6/12/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var mealsViewModel = MealsViewModel()
    var body: some View {
        NavigationStack {
            List{
                ForEach (mealsViewModel.meals) {
                    meal in
                    if mealsViewModel.mealIsValid(meal: meal) {
                        NavigationLink{
                            RecipeView(idMeal: meal.idMeal)
                        } label: {
                            MealRow(meal: meal)
                        }
                    }
                }
                
            }
            .onAppear {
                if mealsViewModel.meals.isEmpty {
                    Task {
                        await mealsViewModel.fetchData(url: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
                    }
                }
            }
            .navigationTitle("Menu")
            .listStyle(.grouped)
        }
    }
}

#Preview {
    ContentView()
}
