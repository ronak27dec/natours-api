//
//  CapabilityManager.swift
//  BasicCapabilityBasedDemo
//
//  Created by Ronak Malick on 22/01/26.
//

import SwiftUI
import Combine

class CapabilityManager: ObservableObject {
    @Published var rootComponents: [any Capability] = []
    
    // The function you were looking for: The Recursive Rebuilder
    func insert(child: any Capability, into parentId: String) {
        // We re-assign the entire root array with a modified version
        self.rootComponents = transform(components: rootComponents,
                                        targetId: parentId,
                                        newChild: child)
    }
    
    /*
     The transform function performs a Deep Copy and Rebuild:
     It loops through your components (the .map).
     It looks for the targetId.
     If it finds it, it creates a copy of that struct, adds the child, and puts the new version back into the array.
     If it doesn't find it at the top level, it recursively dives into the children to try again.
     */
    private func transform(components: [any Capability],
                           targetId: String,
                           newChild: any Capability) -> [any Capability] {
        return components.map { currentComponent in
            var copy = currentComponent
            
            if copy.id == targetId {
                copy.children.append(newChild)
            } else if !copy.children.isEmpty {
                copy.children = transform(components: copy.children,
                                          targetId: targetId,
                                          newChild: newChild)
            }
            
            return copy
        }
    }
    
    func addAtRoot(_ component: any Capability) {
        rootComponents.append(component)
    }
}
