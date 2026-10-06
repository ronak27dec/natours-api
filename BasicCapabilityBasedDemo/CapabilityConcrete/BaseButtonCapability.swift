//
//  BaseButtonCapability.swift
//  BasicCapabilityBasedDemo
//
//  Created by Ronak Malick on 22/01/26.
//

import SwiftUI

struct BaseButtonCapability: Capability {
    let id: String

    func render() -> AnyView {
        AnyView(Button("Base Button (\(id))") {}
            .buttonStyle(.bordered))
    }
}
