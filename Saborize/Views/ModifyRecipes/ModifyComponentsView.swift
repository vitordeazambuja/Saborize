//
//  ModifyIngredientsView.swift
//  Saborize
//
//  Created by Vitor de Azambuja on 25/09/25.
//

import SwiftUI

protocol RecipeComponent: CustomStringConvertible, Codable{
    init()
    static func singularName() -> String
    static func pluralName() -> String
}

extension RecipeComponent{
    static func singularName() -> String{
        String(describing: self).lowercased()
    }
    static func pluralName() -> String{
        self.singularName() + "s"
    }
}

protocol ModifyComponentView: View {
    associatedtype Component
    init(component: Binding<Component>, createAction: @escaping (Component) -> Void)
}

struct ModifyComponentsView<Component: RecipeComponent, DestinationView: ModifyComponentView>: View where DestinationView.Component == Component {
    @Binding var components: [Component]
    @State private var newComponent = Component()
    
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground
    
    var body: some View {
        VStack{
            
            let addComponentView = DestinationView(component: $newComponent){
                component in components.append(component)
                newComponent = Component()
            }.navigationTitle("Add \(Component.singularName().capitalized)")
            
            if components.isEmpty{
                Spacer()
                NavigationLink("Add the first \(Component.singularName())", destination: addComponentView)
                Spacer()
            }else{
                HStack{
                    Text(Component.pluralName().capitalized)
                        .font(.title)
                        .padding()
                    Spacer()
                    EditButton()
                        .padding()
                }
                List{
                    ForEach(components.indices, id: \.self) { index in
                        let component = components[index]
                        let editComponentView = DestinationView(component: $components[index]) { _ in return }
                            .navigationTitle("Edit " + "\(Component.singularName().capitalized)")
                        NavigationLink(component.description, destination: editComponentView)
                            .listRowBackground(listBackgroundColor)
                    }
                    .onDelete { offsets in
                        components.remove(atOffsets: offsets)
                    }
                    .onMove { indices, newOffset in
                        components.move(fromOffsets: indices, toOffset: newOffset)
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var recipe = Recipe.testRecipes[1]
    @Previewable @State var emptyIngredients = [Ingredient]()
    NavigationView{
        ModifyComponentsView<Ingredient,ModifyIngredientView>(components: $recipe.ingredients)
    }
}
