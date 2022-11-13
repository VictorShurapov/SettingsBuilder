//
//  ContentView.swift
//  SettingsBuilder
//
//  Created by Viktor Shurapov on 11/13/22.
//

import SwiftUI

func makeSettings(@SettingsBuilder _ content: () -> [Setting]) -> [Setting] {
    content()
}

struct ContentView: View {
    let accesssLevel: UserAccessLevel = .experimental

    var body: some View {
        let settings = makeSettings {
            Setting(name: "Offline mode", value: .bool(false))
            Setting(name: "Search page size", value: .int(25))
            switch accesssLevel {
            case .restricted:
                Setting.Empty()
            case .normal:
                Setting(name: "Request experimental access", value: .bool(false))
            case .experimental:
                SettingGroup(name: "Experimental") {
                    Setting(name: "Default name", value: .string("Untitled"))
                    Setting(name: "Fluid animation", value: .bool(true))
                }
            }
        }
        
        VStack {
            Image(systemName: "gear")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Settings")
            Text(settings.description)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
