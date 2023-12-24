//
//  ExerciseUI.swift
//  Sleep App
//
//  Created by Matthew Sigit on 24/01/22.
//

import SwiftUI

struct ExerciseUI: View {
    
    @StateObject var SettingsModel: settingsvm = settingsvm()
    @StateObject var navbarModel:  navbarvm = navbarvm()
    @AppStorage ("exercisenotifs") var exercisenotifications:Bool = false
    @AppStorage ("exercisehours") var exercisehours:Int = 4
    
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
                        Text("Exercise Settings")
                            .font(.largeTitle)
                            .padding()
                        
                        Toggle("Exercise Notifications", isOn: $exercisenotifications)
                            .font(.title2)
                            .padding()
                        
                        Text("How many hours prior to sleeping can you exercise? (minimum)")
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Picker(selection: $exercisehours, label: Text("Exercise Hours")) {
                            Text("0").tag(0)
                            Text("1").tag(1)
                            Text("2").tag(2)
                            Text("3").tag(3)
                            Text("4").tag(4)
                            Text("5").tag(5)
                            Text("6").tag(6)
                            Text("7").tag(7)
                            Text("8").tag(8)
                            Text("9").tag(9)
                        }
                    }
                    
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


struct ExerciseUI_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseUI()
    }
}
