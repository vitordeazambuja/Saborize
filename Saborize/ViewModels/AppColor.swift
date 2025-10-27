//
//  AppColor.swift
//  Saborize
//
//  Created by Vitor de Azambuja on 03/09/25.
//

import SwiftUI

struct AppColor{
    static let foreground: Color = Color(.sRGB,red: 168/255,green: 95/255,blue: 0,opacity: 1)
    static let background: Color = Color(.sRGB, red: 255/255,green: 248/255,blue: 184/255,opacity: 1)
}

extension Color: @retroactive RawRepresentable {
    public init?(rawValue: String) {
        do {
            let encodedData = rawValue.data(using: .utf8)!
            let components = try JSONDecoder().decode([Double].self, from: encodedData)
            self = Color(red: components[0],
                         green: components[1],
                         blue: components[2],
                         opacity: components[3])
        }
        catch {
            return nil
        }
    }
    
    public var rawValue: String {
        guard let cgFloatComponents = UIColor(self).cgColor.components else { return "" }
        let doubleComponents = cgFloatComponents.map { Double($0) }
        do {
            let encodedComponents = try JSONEncoder().encode(doubleComponents)
            return String(data: encodedComponents, encoding: .utf8) ?? ""
        }
        catch {
            return ""
        }
    }
}
