//
//  AdBannerCapability.swift
//  BasicCapabilityBasedDemo
//
//  Created by Ronak Malick on 22/01/26.
//

import SwiftUI

struct AdBanner: Capability {
    let id = CapabilityId.adBanner.rawValue

    func render() -> AnyView {
        AnyView(Text("Ad: Buy more storage!")
            .font(.caption)
            .padding(4)
            .background(Color.gray.opacity(0.1)))
    }
}
