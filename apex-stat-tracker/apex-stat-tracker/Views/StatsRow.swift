//
//  SwiftUIView.swift
//  apex-stat-tracker
//
//  Created by Guillermo Che on 11/30/19.
//  Copyright © 2019 webHead. All rights reserved.
//

import SwiftUI

struct StatsRow: View {
    
    var title: String
    var value: String
    var valid: Bool
    
    init(title: String, value: String, valid: Bool) {
        self.title = title
        self.value = value
        self.valid = valid
    }
    
    var body: some View {
        HStack{
            if self.valid {
                Spacer()
                Text(self.title)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                Spacer()
                Text(self.value)
                    .foregroundColor(.white)
                .font(.system(size: 25))
                Spacer()
                
            }
            else {
                EmptyView()
            }
        }.background(Color.init(red: 0.3, green: 0.3, blue: 0.3))
            .cornerRadius(15)
            .padding(.trailing, 10)
            .padding(.leading, 10)
            .padding(.top, 4)
            .padding(.bottom, 4)
    }
        
}

struct StatsRow_Previews: PreviewProvider {
    static var previews: some View {
        StatsRow(title: "Kills", value: "nil", valid: true)
    }
}
