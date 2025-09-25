//
//  ModifyIngredientsView.swift
//  Saborize
//
//  Created by Vitor de Azambuja on 25/09/25.
//

import SwiftUI

struct ModifyIngredientsView: View {
    @Binding var ingredients: [Ingredient]
    @State private var newIngredient = Ingredient()
    
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
                    }
                    NavigationLink("Add another ingredient", destination: ModifyIngredientView(ingredient: $newIngredient) { ingredient in
                        ingredients.append(ingredient)
                        newIngredient = Ingredient()
                    })
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var emptyIngredients: [Ingredient] = []
    NavigationView{
        ModifyIngredientsView(ingredients: $emptyIngredients)
    }
}
