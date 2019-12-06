//
//  SegmentView.swift
//  apex-stat-tracker
//
//  Created by Guillermo Che on 12/3/19.
//  Copyright © 2019 webHead. All rights reserved.
//

import SwiftUI

struct SegmentView: View {
    var segNum : Int
    
    init(segment : Int){
        self.segNum = segment
    }
    var body: some View {
        GeometryReader { geom in
            VStack{
                HStack{
                    Text("Overview")
                        .foregroundColor(.white)
                        .font(.system(size: 40))
                }
                ScrollView(.vertical, showsIndicators: true) {
                    StatsList()
                }.frame(width: geom.size.width,
                    height: geom.size.height * 0.6)
            }.frame(width: geom.size.width)
        }
    }
}

struct SegmentView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentView(segment: 0)
    }
}
