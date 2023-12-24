//
//  AlarmPageUI.swift
//  Sleep App
//
//  Created by Matthew Sigit on 24/01/22.
//

import SwiftUI
import UserNotifications

extension Date: RawRepresentable {
    private static let formatter = ISO8601DateFormatter()
    
    public var rawValue: String {
        Date.formatter.string(from: self)
    }
    
    public init?(rawValue: String) {
        self = Date.formatter.date(from: rawValue) ?? Date()
    }
}


struct AlarmPageUI: View {
    
    private let notificationPublisher = NotificationPublisher()
    
    @StateObject var navbarModel:  navbarvm = navbarvm()
    @AppStorage ("currentBedtime") var currentBedtime: Date = Date()
    @AppStorage ("goalBedtime") var goalBedtime: Date = Date()
    @AppStorage ("coffeenotifs") var coffeenotifications:Bool = false
    @AppStorage ("sugarnotifs") var sugarnotifications:Bool = false
    @AppStorage ("exercisenotifs") var exercisenotifications:Bool = false
    
    var body: some View {
 
        VStack {
            NavigationLink(destination: AlarmPageUI().navigationBarHidden(true), isActive: $navbarModel.showHomeUI, label: { EmptyView() })
            NavigationLink(destination: FlightPageUI().navigationBarHidden(true), isActive: $navbarModel.showFlightUI, label: { EmptyView() })
            NavigationLink(destination: SettingsPageUI().navigationBarHidden(true), isActive: $navbarModel.showSettingsUI, label: { EmptyView() })
            DatePicker("Current Bedtime", selection: $currentBedtime, displayedComponents: .hourAndMinute)
            DatePicker("Goal Bedtime", selection: $goalBedtime, displayedComponents: .hourAndMinute)
            Spacer()
            VStack {
                HStack {
                    //Button {
                        //notificationPublisher.sendNotification(title: "Sleep Notification", subtitle: "Bedtime", body: "It is now bedtime", badge: 10, delayInterval: nil)
                        //send notif for 1 min from now
                    //} label: {
                    Image("Sleep")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .padding(10)
                    Text("2 Hours")
                        .font(.title)
                    //}
                }
                HStack {
                    Image("Coffee")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .padding(10)
                    if coffeenotifications {
                        Text("PASSED")
                            .font(.title)
                    } else {
                    Text("DISABLED")
                        .font(.title)
                    }
                }
                HStack {
                    Image("Sugar")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .padding(10)
                    if sugarnotifications {
                        Text("PASSED")
                            .font(.title)
                    } else {
                    Text("DISABLED")
                        .font(.title)
                    }
                }
                HStack {
                    Image("Exercise")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .padding(10)
                    if exercisenotifications {
                        Text("PASSED")
                            .font(.title)
                    } else {
                    Text("DISABLED")
                        .font(.title)
                    }
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

struct AlarmPageUI_Previews: PreviewProvider {
    static var previews: some View {
        AlarmPageUI()
    }
}
