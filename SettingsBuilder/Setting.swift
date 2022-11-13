//
//  Setting.swift
//  SettingsBuilder
//
//  Created by Viktor Shurapov on 11/13/22.
//

import Foundation

// MARK: - Setting
struct Setting {
    var name: String
    var value: Value
}

extension Setting {
    enum Value {
        case bool(Bool)
        case int(Int)
        case string(String)
        case group([Setting])
    }
}

// MARK: - SettingGroup
struct SettingGroup {
    var name: String
    @SettingsBuilder var settings: () -> [Setting]
}

// MARK: - UserAccessLevel
enum UserAccessLevel {
    case restricted
    case normal
    case experimental
}
