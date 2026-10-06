//
//  BasicCapabilityBasedDemoTests.swift
//  BasicCapabilityBasedDemoTests
//
//  Created by Ronak Malick on 22/01/26.
//

import XCTest
@testable import BasicCapabilityBasedDemo

@MainActor
final class CapabilityManagerTests: XCTestCase {
    var manager: CapabilityManager!
    
    override func setUp() {
        super.setUp()
        manager = CapabilityManager()
    }
    
    override func tearDown() {
        manager = nil
        super.tearDown()
    }
    
    func testAddAtRoot() {
        let root = MockCapability(id: "root")
        manager.addAtRoot(root)
        
        XCTAssertEqual(manager.rootComponents.count, 1)
        XCTAssertEqual(manager.rootComponents.first?.id, "root")
    }
    
    func testNestedInsertion() {
        // 1. Add a parent
        let parent = MockCapability(id: "parent")
        manager.addAtRoot(parent)
        
        // 2. Insert a child into that parent
        let child = MockCapability(id: "child")
        manager.insert(child: child, into: "parent")
        
        // 3. Verify the rebuild worked
        let updatedParent = manager.rootComponents.first as? MockCapability
        XCTAssertEqual(updatedParent?.children.count, 1)
        XCTAssertEqual(updatedParent?.children.first?.id, "child")
    }
    
    func testDeepRecursion() {
        // Create Root -> Folder -> File
        manager.addAtRoot(MockCapability(id: "root"))
        manager.insert(child: MockCapability(id: "folder"), into: "root")
        manager.insert(child: MockCapability(id: "file"), into: "folder")
        
        // Traverse to verify
        let root = manager.rootComponents.first as? MockCapability
        let folder = root?.children.first as? MockCapability
        let file = folder?.children.first
        
        XCTAssertEqual(file?.id, "file")
    }
}
