//
//  ModifyIngredientsView.swift
//  Saborize
//
//  Created by Vitor de Azambuja on 25/09/25.
//

import SwiftUI

protocol RecipeComponent{
    init()
}

struct ModifyComponentsView: View {
    @Binding var ingredients: [Ingredient]
    @State private var newIngredient = Ingredient()
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        VStack{
            if ingredients.isEmpty{
                Spacer()
                NavigationLink("Add the first ingredient", destination: ModifyIngredientView(ingredient: $newIngredient) { ingredient in
                    ingredients.append(ingredient)
                    newIngredient = Ingredient(name: "", quantity: 0.0, unit: .none)
                })
                Spacer()
            }else{
                List{
                    ForEach(ingredients.indices, id: \.self){ index in
                        let ingredient = ingredients[index]
                        Text(ingredient.description)
                    }.listRowBackground(listBackgroundColor)
                    NavigationLink("Add another ingredient", destination: ModifyIngredientView(ingredient: $newIngredient) { ingredient in
                        ingredients.append(ingredient)
                        newIngredient = Ingredient()
                    })
                    .buttonStyle(PlainButtonStyle())
                    .listRowBackground(listBackgroundColor)
                    .foregroundColor(listTextColor)
                }
                .listRowBackground(listBackgroundColor)
            }
        }
    }
}

#Preview {
    @Previewable @State var emptyIngredients: [Ingredient] = []
    NavigationView{
        ModifyComponentsView(ingredients: $emptyIngredients)
    }
}
