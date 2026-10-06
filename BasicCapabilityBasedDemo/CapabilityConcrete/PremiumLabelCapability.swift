//
//  PremiumLabelCapability.swift
//  BasicCapabilityBasedDemo
//
//  Created by Ronak Malick on 22/01/26.
//

import SwiftUI

struct PremiumLabel: Capability {
    let id = CapabilityId.premiumLabel.rawValue

    func render() -> AnyView {
        AnyView(Text("Premium Feature").foregroundColor(.orange).bold())
    }
}
