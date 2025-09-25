//
//  ModifyIngredientView.swift
//  Saborize
//
//  Created by Vitor de Azambuja on 25/09/25.
//

import SwiftUI

struct ModifyIngredientView: View {
    @Binding var ingredient: Ingredient
    var body: some View {
        VStack{
            Form{
                TextField("Ingredient Name", text: $ingredient.name)
                Stepper(value: $ingredient.quantity, in: 0...100,step: 1.0){
                    HStack{
                        Text("Quantity:")
                        TextField("Quantity", value: $ingredient.quantity,formatter: NumberFormatter())
                            .keyboardType(.numbersAndPunctuation)
                    }
                }
                Picker(selection: $ingredient.unit, label:
                        HStack{
                    Text("Unit")
                    Spacer()
                    Text(ingredient.unit.rawValue)
                }) {
                    ForEach(Ingredient.Unit.allCases, id: \.self){ unit in
                        Text(unit.rawValue)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
        }
    }
}
    
#Preview {
    @Previewable @State var emptyIngredient = Ingredient(name: "", quantity: 1.0, unit: .none)
    NavigationView {
        ModifyIngredientView(ingredient: $emptyIngredient)
    }
}
