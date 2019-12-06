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
    
    init(title: String, value: String) {
        self.title = title
        self.value = value
    }
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Spacer()
                Text(self.title)
                    .frame(height: geometry.size.height * 0.075)
                Spacer()
                Text(self.value)
                Spacer()
            }.background(
                Color.white.edgesIgnoringSafeArea(.all))
            .padding()
        }
    }
}

struct StatsRow_Previews: PreviewProvider {
    static var previews: some View {
        StatsRowView()
    }
}
