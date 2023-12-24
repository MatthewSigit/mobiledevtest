//
//  GoogleLogin.swift
//  Sleep App
//
//  Created by Matthew Sigit on 24/01/22.
//

import SwiftUI

struct GoogleLoginUI: View {
    
    @StateObject var GlaunchModel: gloginvm = gloginvm()
    
    var body: some View {
        
        HStack {
            NavigationLink(destination: AccountcreationUI().navigationBarHidden(false), isActive: $GlaunchModel.showsignupUI, label: { EmptyView() })
            NavigationLink(destination: DataSyncUI().navigationBarHidden(false), isActive: $GlaunchModel.showLoginUI, label: { EmptyView() })
            
            VStack {
                Image("GoogleLogo")
                    .background(
                        Circle()
                            .fill(Color("LoginBGC"))
                            .scaleEffect(2,anchor:.bottom)
                    )
                
                Button {
                    GlaunchModel.showLoginUI=true
                } label: {
                    HStack {
                        Image("GoogleLogo")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("Login with Google")
                            .font(.largeTitle)
                    }
                }
                HStack {
                    Button {
                        GlaunchModel.showsignupUI=true
                    } label: {
                        Text("Create Account")
                            .font(.title2)
                    }
                }
            }
        }
        
    }
}

struct GoogleLoginUI_Previews: PreviewProvider {
    static var previews: some View {
        GoogleLoginUI()
    }
}
