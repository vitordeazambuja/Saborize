//
//  RecipeCategoryGridView.swift
//  Saborize
//
//  Created by Vitor de Azambuja on 08/09/25.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    var body: some View {
        let columns = [GridItem(),GridItem()]
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns, content: {
                    ForEach(MainInformation.Category.allCases, id: \.self){
                        category in CategoryView(category: category)
                    }
                })
                .navigationTitle("Categories")
            }
        }
    }
}

struct CategoryView: View{
    let category: MainInformation.Category
    var body: some View{
        ZStack{
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.35)
            Text(category.rawValue)
                .font(.title)
        }
    }
}

#Preview {
    RecipeCategoryGridView()
}
