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
            ScrollView{
                let columns = [GridItem(),GridItem()]
                LazyVGrid(columns: columns, content: {
                    ForEach(MainInformation.Category.allCases, id: \.self){
                        category in
                        ZStack{
                            Image(category.rawValue)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Text(category.rawValue)
                                .font(.title)
                        }
                    }
                })
                .navigationTitle("Categories")
            }
        }
    }
}

#Preview {
    RecipeCategoryGridView()
}
