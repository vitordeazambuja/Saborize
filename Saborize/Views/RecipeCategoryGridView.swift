//
//  RecipeCategoryGridView.swift
//  Saborize
//
//  Created by Vitor de Azambuja on 08/09/25.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    private var recipeData = RecipeData()
    
    var body: some View {
        NavigationView{
            LazyVGrid(columns: [GridItem()], content: {
                ForEach(MainInformation.Category.allCases, id: \.self){
                    category in
                    Text(category.rawValue)
                        .font(.title)
                }
            })
            .navigationTitle("Categories")
        }
    }
}

#Preview {
    RecipeCategoryGridView()
}
