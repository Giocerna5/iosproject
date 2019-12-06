//
//  SegmentView.swift
//  apex-stat-tracker
//
//  Created by Guillermo Che on 12/3/19.
//  Copyright © 2019 webHead. All rights reserved.
//

import SwiftUI

struct SegmentView: View {
    @EnvironmentObject var viewModel: AccountViewModel
    var segNum : Int
    
    init(segment : Int){
        self.segNum = segment
    }
    var body: some View {
        GeometryReader { geom in
            VStack{
                HStack{
                    Text(self.$viewModel.acc.wrappedValue.data?.segments?[self.segNum].metadata?.name ?? "Loading...")
                        .foregroundColor(.white)
                        .font(.system(size: 40))
                }
                ScrollView(.vertical, showsIndicators: true) {
                    StatsList(segment: self.segNum)
                }.frame(width: geom.size.width,
                    height: geom.size.height * 0.6)
            }.frame(width: geom.size.width)
        }
    }
}

struct SegmentView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentView(segment: 0).environmentObject(AccountViewModel())
    }
}
