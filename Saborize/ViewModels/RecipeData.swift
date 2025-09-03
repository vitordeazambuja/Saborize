//
//  RecipeData.swift
//  Saborize
//
//  Created by Vitor de Azambuja on 02/09/25.
//

import Foundation

class RecipeData: ObservableObject{
    @Published var recipes = Recipe.testRecipes
}
