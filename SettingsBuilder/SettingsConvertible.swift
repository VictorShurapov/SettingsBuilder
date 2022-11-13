//
//  SettingsConvertible.swift
//  SettingsBuilder
//
//  Created by Viktor Shurapov on 11/13/22.
//

import Foundation

protocol SettingsConvertible {
    func asSettings() -> [Setting]
}

extension Setting: SettingsConvertible {
    func asSettings() -> [Setting] { [self] }
}

extension SettingGroup: SettingsConvertible {
    func asSettings() -> [Setting] {
        [Setting(name: name, value: .group(settings()))]
    }
}

extension Array: SettingsConvertible where Element == Setting {
    func asSettings() -> [Setting] { self }
}

extension Setting {
    struct Empty: SettingsConvertible {
        func asSettings() -> [Setting] { [] }
    }
}
