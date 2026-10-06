//
//  SettingsSectionCapability.swift
//  BasicCapabilityBasedDemo
//
//  Created by Ronak Malick on 22/01/26.
//

import SwiftUI

struct SettingsSection: Capability {
    let id: String
    var children: [any Capability] = []
    
    func render() -> AnyView {
        AnyView(
            VStack(alignment: .leading) {
                Text(id).font(.headline)
                ForEach(0..<children.count, id: \.self) { index in
                    children[index].render()
                }
            }
                .padding()
                .background(Color.gray.opacity(0.1))
        )
    }
}
