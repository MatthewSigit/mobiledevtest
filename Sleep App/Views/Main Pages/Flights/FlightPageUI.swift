//
//  FlightPageUI.swift
//  Sleep App
//
//  Created by Matthew Sigit on 24/01/22.
//

import SwiftUI

struct FlightPageUI: View {
    
    @StateObject var navbarModel:  navbarvm = navbarvm()
    @StateObject var flightModel: flightvm = flightvm()
    @State var dayofflight = Date()
    @State var flightnumber = String()
    
    var body: some View {
        VStack {
            HStack {
                NavigationLink(destination:AlarmPageUI().navigationBarHidden(true), isActive: $navbarModel.showHomeUI, label: { EmptyView() })
                NavigationLink(destination:FlightPageUI().navigationBarHidden(true), isActive: $navbarModel.showFlightUI, label: { EmptyView() })
                NavigationLink(destination:SettingsPageUI().navigationBarHidden(true), isActive: $navbarModel.showSettingsUI, label: { EmptyView() })
                NavigationLink(destination:PreviousFlightsUI().navigationBarHidden(false), isActive: $flightModel.showpreviousflightUI, label: { EmptyView() })
            }
           
            Text("Flight API!")
                .font(.largeTitle)
            Text("You must be signed in with google to use this service")
                .font(.caption)
            Spacer()
            TextField("Enter flight number", text: $flightnumber)
                .padding()
                .font(.largeTitle)
            DatePicker("Day of Flight:",selection: $dayofflight,displayedComponents:.date)
                .padding()
                .font(.largeTitle)
            Spacer()
            
            Button {
                //search for a flight
            } label: {
                Text("Search For This Flight")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.black)
                    .font(.title2)
                    .cornerRadius(20)
                    .padding(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 5)
                        )
            }
            Button {
                flightModel.showpreviousflightUI = true
            } label: {
                Text("See previous flights")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.black)
                    .font(.title3)
                    .cornerRadius(20)
                    .padding(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 5)
                        )
            }
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

struct FlightPageUI_Previews: PreviewProvider {
    static var previews: some View {
        FlightPageUI()
    }
}
