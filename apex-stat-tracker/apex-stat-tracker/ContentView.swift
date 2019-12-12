//
//  ContentView.swift
//  apex-stat-tracker
//
//  Created by David Olivares on 11/18/19.
//  Copyright © 2019 webHead. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AccountViewModel
    @EnvironmentObject var sessionController: SessionController
    
    var body: some View {
        Group{
            if (self.sessionController.session != nil) {
                ProfileView()
              } else {
                LogInView()
              }
        }.onAppear(perform: self.sessionController.listen)
    }
} // class




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AccountViewModel())
            .environmentObject(SessionController())
    }
}
