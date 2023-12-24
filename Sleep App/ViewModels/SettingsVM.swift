//
//  SettingsVM.swift
//  Sleep App
//
//  Created by Matthew Sigit on 24/01/22.
//

import Foundation

class settingsvm: ObservableObject {
    @Published var showCoffeeUI: Bool=false
    @Published var showSleepUI: Bool=false
    @Published var showExerciseUI: Bool=false
    @Published var showSugarUI: Bool=false
}
