//
//  AuthenticationApp.swift
//  Shared
//
//  Created by 坂本唯斗 on 2023/02/18.
//

import SwiftUI

@main
struct AuthenticationApp: App {
    @State var preText: String = ""
    @State var text: String = ""
    var body: some Scene {
        MenuBarExtra("多要素認証") {
            ContentView()
        }
    }
}
