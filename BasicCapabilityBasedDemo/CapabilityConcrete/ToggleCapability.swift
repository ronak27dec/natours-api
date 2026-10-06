//
//  ToggleCapability.swift
//  BasicCapabilityBasedDemo
//
//  Created by Ronak Malick on 22/01/26.
//

import SwiftUI

struct ToggleFeature: Capability {
    let id: String

    func render() -> AnyView {
        AnyView(Toggle("Enable \(id)", isOn: .constant(true)))
    }
}
