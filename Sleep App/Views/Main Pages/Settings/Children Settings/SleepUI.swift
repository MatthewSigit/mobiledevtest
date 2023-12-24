//
//  SleepUI.swift
//  Sleep App
//
//  Created by Matthew Sigit on 24/01/22.
//

import SwiftUI

struct SleepUI: View {
    
    @StateObject var SettingsModel: settingsvm = settingsvm()
    @StateObject var navbarModel:  navbarvm = navbarvm()
    @AppStorage ("sleepnotifs") var sleepnotifications:Bool = false
    @AppStorage ("sleepwarnings") var sleepwarnings:Int = 0
    @AppStorage ("Interval") var interval:Int = 5
    
    var body: some View {
        
        NavigationView {
            
            ZStack() {
                NavigationLink(destination: SleepUI().navigationBarHidden(true), isActive: $SettingsModel.showSleepUI, label: { EmptyView() })
                
                NavigationLink(destination: CoffeeUI().navigationBarHidden(true), isActive: $SettingsModel.showCoffeeUI, label: { EmptyView() })
                
                NavigationLink(destination: ExerciseUI().navigationBarHidden(true), isActive: $SettingsModel.showExerciseUI, label: { EmptyView() })
    
                NavigationLink(destination: SugarUI().navigationBarHidden(true), isActive: $SettingsModel.showSugarUI, label: { EmptyView() })
                
                NavigationLink(destination: AlarmPageUI().navigationBarHidden(true), isActive: $navbarModel.showHomeUI, label: { EmptyView() })
                NavigationLink(destination: FlightPageUI().navigationBarHidden(true), isActive: $navbarModel.showFlightUI, label: { EmptyView() })
                NavigationLink(destination: SettingsPageUI().navigationBarHidden(true), isActive: $navbarModel.showSettingsUI, label: { EmptyView() })
                VStack() {
                    HStack(alignment:.top) {
                        Button(action: {
                            SettingsModel.showSleepUI = true
                            SettingsModel.showCoffeeUI = false
                            SettingsModel.showExerciseUI = false
                            SettingsModel.showSugarUI = false
                        }) {
                            Image("Sleep")
                                .resizable()
                                .frame(width: 80, height: 100)
                        }
                        Button(action: {
                            SettingsModel.showSleepUI = false
                            SettingsModel.showExerciseUI = false
                            SettingsModel.showSugarUI = false
                            SettingsModel.showCoffeeUI = true
                        }) {
                            Image("Coffee")
                                .resizable()
                                .frame(width: 120, height: 80)
                        }
                        Button(action: {
                            SettingsModel.showSleepUI = false
                            SettingsModel.showCoffeeUI = false
                            SettingsModel.showExerciseUI = true
                            SettingsModel.showSugarUI = false
                        }) {
                            Image("Exercise")
                                .resizable()
                                .frame(width: 80, height: 80)
                        }
                        Button(action: {
                            SettingsModel.showSleepUI = false
                            SettingsModel.showCoffeeUI = false
                            SettingsModel.showExerciseUI = false
                            SettingsModel.showSugarUI = true
                        }) {
                            Image("Sugar")
                                .resizable()
                                .frame(width: 80, height: 80)
                        }
                    }
                    VStack {
                        Text("Sleep Settings")
                            .font(.largeTitle)
                        Spacer()
                        
                        Toggle("Sleep Notifications", isOn: $sleepnotifications)
                            .font(.title2)
                        Spacer()
                        
                        Text("How many five minute warnings would you like?")
                            .multilineTextAlignment(.center)
                        
                        Picker(selection: $sleepwarnings, label: Text("")) {
                            Text("0").tag(0)
                            Text("1").tag(1)
                            Text("2").tag(2)
                            Text("3").tag(3)
                            Text("4").tag(4)
                        }
                        
                        
                        Text("Choosing 0 means you will still receive a notification at bedtime.")
                            .multilineTextAlignment(.center)
                            .font(.caption)
                        Spacer()
                    Spacer()
                    
                    HStack(alignment:.bottom){
                        Spacer()
                        
                        Button {
                            navbarModel.showHomeUI = true
                        } label: {
                        Image("Home")
                            .resizable()
                            .frame(width: 50, height: 50)
                        }
                        
                        Spacer()
                        
                        Button {
                            navbarModel.showFlightUI = true
                        } label: {
                        Image("Flight")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    
                        Spacer()
                    
                    
                        Button {
                            navbarModel.showSettingsUI = true
                        } label: {
                        Image("Settings")
                            .resizable()
                            .frame(width: 50, height: 50)
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color("NavBGC"))
                   
                    }
            }
            }
        }
        }


struct SleepUI_Previews: PreviewProvider {
    static var previews: some View {
        SleepUI()
    }
}
}
