//
//  RecipeView.swift
//  DessertRecipes
//
//  Created by Ray on 6/12/24.
//

import SwiftUI

struct RecipeView: View {
    let idMeal: String
    @StateObject var recipeViewModel = RecipeViewModel()
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: recipeViewModel.recipe?.strMealThumb ?? "")) {
                phase in
                switch (phase) {
                    
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()

                    
                case .failure(_):
                    Color
                        .gray
                        .opacity(0.75)
                        .overlay(
                            Image(systemName: "photo")
                                .foregroundColor(.white)
                                .font(.system(size: 30, weight: .bold))
                            
                        )
                case .empty:
                    Color
                        .gray
                        .overlay(
                            ProgressView()
                        )
                @unknown default:
                    EmptyView()
                }
            }
            .clipShape(Circle())
            .frame(maxWidth: 200, maxHeight: 200)
            
            Text(recipeViewModel.recipe?.strMeal ?? "")
                .bold()
                .font(.title)
            
            ScrollView {
                Text(recipeViewModel.recipe?.strInstructions ?? "")
                    .padding()
            }
            
            List {
                ForEach (recipeViewModel.getIngridientAndMeasures()) {
                    item in
                    HStack {
                        Text(item.ingredient)
                        Spacer()
                        Text(item.measure)
                    }
                }
            }
        }
        .onAppear {
            if recipeViewModel.recipe == nil {
                Task {
                    await recipeViewModel.fetchData(url: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(idMeal)")
                }
            }
        }
    }
}

#Preview {
    RecipeView(idMeal: "53049")
}
