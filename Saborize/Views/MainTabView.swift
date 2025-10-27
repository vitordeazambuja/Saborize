//
//  MainTabView.swift
//  Saborize
//
//  Created by Vitor de Azambuja on 20/10/25.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var recipeData = RecipeData()
    
    var body: some View {
        TabView{
            RecipeCategoryGridView()
                .tabItem{
                    Label("Recipes", systemImage: "list.dash")
                }
            NavigationView{
                RecipesListView(category: .breakfast, viewStyle: .favorites)
            }
            .tabItem{
                Label("Favorites", systemImage: "heart.fill")
            }
            SettingsView()
                .tabItem{
                    Label("Settings", systemImage: "gear")
                }
        }
        .environmentObject(recipeData)
    }
}

#Preview {
    MainTabView()
}
