//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Ex10si0n Yan on 6/25/23.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData)
        }
    }
}
