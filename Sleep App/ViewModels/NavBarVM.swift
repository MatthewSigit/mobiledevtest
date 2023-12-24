//
//  NavBarVM.swift
//  Sleep App
//
//  Created by Matthew Sigit on 24/01/22.
//

import Foundation

class navbarvm: ObservableObject {
    @Published var showHomeUI: Bool=false
    @Published var showFlightUI: Bool=false
    @Published var showSettingsUI: Bool=false
}
