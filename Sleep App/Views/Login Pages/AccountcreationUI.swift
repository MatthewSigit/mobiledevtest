//
//  AccountcreationUI.swift
//  Sleep App
//
//  Created by Matthew Sigit on 24/01/22.
//

import SwiftUI

struct AccountcreationUI: View {
    
    @StateObject var LaunchModel: loginvm = loginvm()
    
    @State var useremail: String = ""
    @State var password: String = ""
    var body: some View {
        ZStack {
            NavigationLink(destination: GoogleLoginUI().navigationBarHidden(false), isActive: $LaunchModel.showgoogleUI, label: { EmptyView() })
        VStack() {
            TextField("Enter email...", text: $useremail)
                .font(.largeTitle)
                .padding()
            TextField("Password", text: $password)
                .font(.largeTitle)
                .padding()
            Button {
                LaunchModel.showgoogleUI = true
            } label: {
                Text("Sign Up!")
                    .accessibilityAddTraits([.isButton])
                    .font(.largeTitle)
                    .accessibilityIdentifier("Offline")
                    .padding()
                    .background(Color.blue)
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

struct AccountcreationUI_Previews: PreviewProvider {
    static var previews: some View {
        AccountcreationUI()
    }
}
