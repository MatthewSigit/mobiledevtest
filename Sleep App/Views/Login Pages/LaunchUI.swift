//
//  SwiftUIView.swift
//  Sleep App
//
//  Created by Matthew Sigit on 20/01/22.
//

import SwiftUI

struct LaunchUI: View {
    
    @StateObject var LaunchModel: loginvm = loginvm()
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                NavigationLink(destination: AlarmPageUI().navigationBarHidden(true), isActive: $LaunchModel.showlaunchUI, label: { EmptyView() })
                NavigationLink(destination: GoogleLoginUI().navigationBarHidden(false), isActive: $LaunchModel.showgoogleUI, label: { EmptyView() })
                
                VStack {
                    Image("Icons")
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                    
                    Text("Sleep App")
                        .font(.largeTitle)
                    
                    Button(action: {
                        LaunchModel.showgoogleUI = true
                    }) {
                        Text("Google Login")
                            .accessibilityAddTraits([.isButton])
                            .font(.largeTitle)
                            .accessibilityIdentifier("online")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.black)
                            .font(.title)
                            .cornerRadius(20)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black, lineWidth: 5)
                            )
                    }
                    .padding()
                    .padding()
                    Button{
                        LaunchModel.showlaunchUI = true
                        
                        
                    }
                label: {
                    Text("Offline Login")
                        .accessibilityAddTraits([.isButton])
                        .font(.largeTitle)
                        .accessibilityIdentifier(/*@START_MENU_TOKEN@*/"Offline"/*@END_MENU_TOKEN@*/)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .font(.title)
                        .cornerRadius(20)
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black, lineWidth: 5)
                        )
                }
                }
            }
        }
    }
}
struct LaunchUI_Previews: PreviewProvider {
    static var previews: some View {
        LaunchUI()
    }
}
