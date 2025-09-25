//
//  ModifyIngredientView.swift
//  Saborize
//
//  Created by Vitor de Azambuja on 25/09/25.
//

import SwiftUI

struct ModifyIngredientView: View {
    @Binding var ingredient: Ingredient
    let createAction: ((Ingredient)->Void)
    
    @Environment(\.presentationMode) private var mode
    
    var body: some View {
        VStack{
            Form{
                TextField("Ingredient Name", text: $ingredient.name)
                Stepper(value: $ingredient.quantity, in: 0...100,step: 0.5){
                    HStack{
                        Text("Quantity:")
                        TextField("Quantity", value: $ingredient.quantity,formatter: NumberFormatter.decimal)
                            .keyboardType(.numbersAndPunctuation)
                    }
                }
                Picker(selection: $ingredient.unit, label:
                        HStack{
                    Text("Unit")
                }) {
                    ForEach(Ingredient.Unit.allCases, id: \.self){ unit in
                        Text(unit.rawValue)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                HStack{
                    Spacer()
                    Button("Save"){
                        createAction(ingredient)
                        mode.wrappedValue.dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}

extension NumberFormatter{
    static var decimal: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
}

#Preview {
    @Previewable @State var emptyIngredient = Ingredient(name: "", quantity: 1.0, unit: .none)
    NavigationView {
        ModifyIngredientView(ingredient: $emptyIngredient){ingredient in
            print(ingredient)
        }
    }
}
