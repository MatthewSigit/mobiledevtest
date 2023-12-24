//
//  DataSyncUI.swift
//  Sleep App
//
//  Created by Matthew Sigit on 24/01/22.
//

import SwiftUI

struct DataSyncUI: View {
    
    @StateObject var LaunchModel: loginvm = loginvm()
    
    var body: some View {
        VStack {
            HStack {
                NavigationLink(destination: AlarmPageUI().navigationBarHidden(true), isActive: $LaunchModel.showlaunchUI, label: { EmptyView() })
            }
            Text("You Have Two File Saves!")
                .font(.title)
            HStack {
                VStack {
                    VStack {
                        Text("Google File Save")
                        Text("Sleep: Off, 0, 5")
                        Text("Exercise: Off, 4")
                        Text("Coffee: Off, 6")
                        Text("Sugar: Off, 4")
                        Text("Bedtime: 21:00")
                        Text("Goal Bedtime: 20:00")
                    }
                    .padding(10)
                    .cornerRadius(10)
                    .background(Color.gray)
                    .foregroundColor(.black)
                    Button {
                        LaunchModel.showlaunchUI = true
                    } label: {
                        Text("Use Google File Save")
                    }
                }
                VStack {
                    VStack {
                        Text("Local Save")
                        Text("Sleep: Off, 0, 5")
                        Text("Exercise: Off, 4")
                        Text("Coffee: Off, 6")
                        Text("Sugar: Off, 4")
                        Text("Bedtime: 21:00")
                        Text("Goal Bedtime: 20:00")
                    }
                    .padding(10)
                    .cornerRadius(10)
                    .background(Color.gray)
                    .foregroundColor(.black)
                    Button {
                        LaunchModel.showlaunchUI = true
                    } label: {
                        Text("Use Local Save")
                    }
                }
                
            }
        }
    }
}

struct DataSyncUI_Previews: PreviewProvider {
    static var previews: some View {
        DataSyncUI()
    }
}
