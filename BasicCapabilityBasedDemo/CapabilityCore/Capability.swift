//
//  Capability.swift
//  BasicCapabilityBasedDemo
//
//  Created by Ronak Malick on 22/01/26.
//

import SwiftUI

@MainActor
public protocol Capability: Identifiable {
    var id: String { get }
    var children: [any Capability] { get set }

    @ViewBuilder
    func render() -> AnyView
}

// Extension for children as all capabilities may not have a children
extension Capability {
    var children: [any Capability] {
        get { [] }
        set { }
    }
}
