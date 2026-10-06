//
//  ContentView.swift
//  BasicCapabilityBasedDemo
//
//  Created by Ronak Malick on 22/01/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var manager = CapabilityManager()
    
    var body: some View {
        NavigationView {
            VStack {
                // THE DYNAMIC CONTENT AREA
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        if manager.rootComponents.isEmpty {
                            EmptyStateView()
                        } else {
                            // Loop through top-level components
                            ForEach(0..<manager.rootComponents.count, id: \.self) { index in
                                manager.rootComponents[index].render()
                            }
                        }
                    }
                    .padding()
                }
                
                // THE CONTROL PANEL (Testing the Runtime Logic)
                ControlPanelView(manager: manager)
            }
            .navigationTitle("Dynamic App")
        }
    }
}

struct EmptyStateView: View {
    var body: some View {
        VStack {
            Image(systemName: "square.dashed")
                .font(.largeTitle)
                .foregroundColor(.gray)
            Text("No capabilities registered yet.")
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 50)
    }
}

struct ControlPanelView: View {
    @ObservedObject var manager: CapabilityManager
    
    var body: some View {
        VStack(spacing: 12) {
            Divider()
            Text("Runtime Commands").font(.caption).bold()
            
            HStack {
                Button("Add Settings Group") {
                    let group = SettingsSection(id: "Account_Group")
                    manager.addAtRoot(group)
                }
                
                Button("Add Button to Group") {
                    let btn = BaseButtonCapability(id: CapabilityId.baseButton.rawValue)
                    manager.insert(child: btn, into: "Account_Group")
                }
            }
            .buttonStyle(.bordered)
            .controlSize(.small)
            
            Button("Add Flat Button") {
                manager.addAtRoot(BaseButtonCapability(id: CapabilityId.baseButton.rawValue))
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            .controlSize(.small)
        }
        .padding()
        .background(Color(uiColor: .systemGroupedBackground))
    }
}
