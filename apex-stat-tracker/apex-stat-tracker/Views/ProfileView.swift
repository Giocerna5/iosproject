//
//  ProfileView.swift
//  apex-stat-tracker
//
//  Created by David Olivares on 11/18/19.
//  Copyright © 2019 webHead. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AccountViewModel
    @State var segmentNumber : Int = 0
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack {
                    
                    HStack {
                        Text("Username: " + (self.$viewModel.acc.wrappedValue.data?.platformInfo?.platformUserHandle ?? "nil") ).foregroundColor(.red)
                        Spacer()
                        Text("Platform: xbox").foregroundColor(.red)
                    }
                    Spacer()
                    
                    SegmentView(segment: 0)
                    

                } // V Stack
                .background(
                    Image(uiImage:      ($viewModel.remoteImageData.wrappedValue.isEmpty ?
                            UIImage(imageLiteralResourceName: "lifeline-profile") :
                            UIImage(data: $viewModel.remoteImageData.wrappedValue)!) )
                        .resizable()
                        .opacity(0.7)
                )
                Spacer()
            } // H Stack
            .background(
                Image("apex-background").resizable()
                .opacity(0.5)
                )
        } //V stack
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .onAppear(perform: self.viewModel.load)
    } // body
    
    func getLegendImage() -> Image{
        if($viewModel.remoteImageData.wrappedValue.isEmpty){
            return Image("lifeline-profile")
        }
        else{
            return Image(uiImage: UIImage(data: $viewModel.remoteImageData.wrappedValue)! )
        }
    }

}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(AccountViewModel())
    }
}

