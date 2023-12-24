//
//  PreviousFlightsUI.swift
//  Sleep App
//
//  Created by Matthew Sigit on 24/01/22.
//

import SwiftUI

struct PreviousFlightsUI: View {
    @State var visible: Bool = true
    @State var visible2: Bool = true
    var body: some View {
        VStack {
            Text("Previous Flights")
                .font(.title)
            if (visible == true) {
                HStack {
                    VStack {
                        Text("Date Added: Jan 24, 2022")
                        Text("Date: Jan 27, 2022")
                        Text("Flight Number: SQ305")
                        Text("From: London, (GMT+0)")
                        Text("To: Singapore, (GMT+8)")
                    }
                    Button {
                        visible = false
                    } label: {
                        Image("Delete")
                            .resizable()
                            .frame(width:30,height:30)
                    }
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.gray)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 5)
                )
            }
            if (visible2 == true) {
                HStack {
                    VStack {
                        Text("Date Added: Jan 24, 2022")
                        Text("Date: Jan 27, 2022")
                        Text("Flight Number: SQ")
                        Text("From: Singapore, (GMT+8)")
                        Text("To: Jakarta, (GMT+7)")
                    }
                    Button {
                        visible2 = false
                    } label: {
                        Image("Delete")
                            .resizable()
                            .frame(width:30,height:30)
                    }
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.gray)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 5)
                )
            }
            Spacer()
        }
    }
}

struct PreviousFlightsUI_Previews: PreviewProvider {
    static var previews: some View {
        PreviousFlightsUI()
    }
}
