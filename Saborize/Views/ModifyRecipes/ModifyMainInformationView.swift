//
//  ModifyMainInformationView.swift
//  Saborize
//
//  Created by Vitor de Azambuja on 23/09/25.
//

import SwiftUI

struct ModifyMainInformationView: View {
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    @Binding var mainInformation: MainInformation
    
    var body: some View {
        Form{
            TextField("Recipe Name", text: $mainInformation.name)
                .listRowBackground(listBackgroundColor)
            TextField("Author", text: $mainInformation.author)
                .listRowBackground(listBackgroundColor)
            Section(header: Text("Description")){
                TextEditor(text: $mainInformation.description)
                          .listRowBackground(listBackgroundColor)
            }
            Picker(selection: $mainInformation.category, label:
                HStack{
                    Text("Category")
                    Spacer()
                    Text(mainInformation.category.rawValue)
                }) {
                    ForEach(MainInformation.Category.allCases, id: \.self) { category in
                        Text(category.rawValue)
                    }
                }
                    .listRowBackground(listBackgroundColor)
                    .pickerStyle(MenuPickerStyle())
        }
        .foregroundColor(listTextColor)
    }
}

#Preview {
    @Previewable @State var mainInformation = MainInformation(name: "",description: "",author: "",category: .breakfast)
    ModifyMainInformationView(mainInformation: $mainInformation)
}
