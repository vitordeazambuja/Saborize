//
//  ContentView.swift
//  Saborize
//
//  Created by Vitor de Azambuja on 22/08/25.
//

import SwiftUI

struct RecipesListView: View {
    @StateObject var recipeData = RecipeData()
    
    var body: some View {
        List{
            ForEach(recipeData.recipes){
                recipe in Text(recipe.mainInformation.name)
            }
        }
        .navigationTitle(navigationTitle)
    }
}

extension RecipesListView {
    var recipes: [Recipe]{
        recipeData.recipes
    }
    
    var navigationTitle: String{
        "All Recipes"
    }
}

#Preview {
    NavigationView{
        RecipesListView()
    }
}
