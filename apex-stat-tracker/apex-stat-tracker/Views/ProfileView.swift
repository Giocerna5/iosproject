//
//  ProfileView.swift
//  apex-stat-tracker
//
//  Created by David Olivares on 11/18/19.
//  Copyright © 2019 webHead. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Image("legendsBacksplash")
            .resizable()
                .aspectRatio(contentMode: .fit)

            // Profile Image & Username HStack
            HStack {
            Image("lifeline-profile")
            .resizable()
                .frame(width:100, height: 100)
            Text("Username: D-Rexx69")
            Spacer()
            }
            HStack {
                VStack {
                    Text("Platform: Xbox")
                    Text("Kills: 407")
                    Text("Wins: 203")
                    Text("Legend: Lifeline")
                }
                Spacer()
            }
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
