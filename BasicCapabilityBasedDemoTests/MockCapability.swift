//
//  MockCapability.swift
//  BasicCapabilityBasedDemoTests
//
//  Created by Ronak Malick on 22/01/26.
//

import SwiftUI
@testable import BasicCapabilityBasedDemo

struct MockCapability: Capability {
    let id: String
    var children: [any Capability] = []
    func render() -> AnyView { AnyView(EmptyView()) }
}
