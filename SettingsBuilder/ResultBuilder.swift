//
//  ResultBuilder.swift
//  SettingsBuilder
//
//  Created by Viktor Shurapov on 11/13/22.
//

import Foundation

@resultBuilder
struct SettingsBuilder {
    static func buildBlock(_ values: SettingsConvertible...) -> [Setting] {
        return values.flatMap { $0.asSettings() }
    }
}

extension SettingsBuilder {
    static func buildIf(_ value: SettingsConvertible?) -> SettingsConvertible {
        value ?? []
    }
}

extension SettingsBuilder {
    static func buildEither(first: SettingsConvertible) -> SettingsConvertible {
        return first
    }
    
    static func buildEither(second: SettingsConvertible) -> SettingsConvertible {
        return second
    }
}
