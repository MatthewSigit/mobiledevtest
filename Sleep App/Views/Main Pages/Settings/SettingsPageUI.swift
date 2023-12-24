//
//  SettingsPageUI.swift
//  Sleep App
//
//  Created by Matthew Sigit on 24/01/22.
//

import SwiftUI

struct SettingsPageUI: View {
    
    @StateObject var SettingsModel: settingsvm = settingsvm()
    @StateObject var navbarModel:  navbarvm = navbarvm()
    
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
                        Button {
                            SettingsModel.showSleepUI = true
                            SettingsModel.showCoffeeUI = false
                            SettingsModel.showExerciseUI = false
                            SettingsModel.showSugarUI = false
                        } label: {
                            Image("Sleep")
                                .resizable()
                                .frame(width: 80, height: 100)
                                .foregroundColor(.green)
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
                    Text("Please Click an Icon to edit settings.")
                        .frame(width:390,height:500)
                    
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

struct SettingsPageUI_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPageUI()
    }
}
