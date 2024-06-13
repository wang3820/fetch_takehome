//
//  MealRow.swift
//  DessertRecipes
//
//  Created by Ray on 6/12/24.
//

import SwiftUI

struct MealRow: View {
    let meal: Meal
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: meal.strMealThumb)) {
                phase in
                switch (phase) {
                    
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/))
                    
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
            .frame(maxWidth: 100, maxHeight: 100)
            .clipShape(RoundedRectangle(cornerSize: /*@START_MENU_TOKEN@*/CGSize(width: 20, height: 10)/*@END_MENU_TOKEN@*/))
            
            
            Text(meal.strMeal)
        }
    }
}

//#Preview {
//    MealRow()
//}
