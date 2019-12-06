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
                        Text((self.$viewModel.acc.wrappedValue
                            .data?.platformInfo?.platformUserHandle?.uppercased() ?? "nil") )
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                        Spacer()
                        Text("XBOX")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                    }
                    Spacer()
                    
                    SegmentView(segment: segmentNumber)
                    
                    HStack{
                        Button(action: {
                            if self.segmentNumber > 0 {
                                print(self.segmentNumber)
                                self.segmentNumber -= 1
                            }
                        }) {
                            Text("Previous")
                            .foregroundColor(Color.init(red: 0.3, green: 0.3, blue: 0.3))
                            .font(.system(size: 25))
                            .padding(10)
                        }.background(Color.white)
                        .cornerRadius(15)
                        .padding(.trailing, 10)
                        .padding(.leading, 10)
                        .padding(.top, 4)
                        .padding(.bottom, 4)
                        
                        Spacer()
                        
                        Button(action: {
                            if self.segmentNumber < (self.$viewModel.acc.wrappedValue.data?.segments?.count ?? 0) - 1{
                                self.segmentNumber += 1
                            }
                        }) {
                            Text("Next")
                            .foregroundColor(Color.init(red: 0.3, green: 0.3, blue: 0.3))
                            .font(.system(size: 25))
                            .padding(10)
                        }.background(Color.white)
                        .cornerRadius(15)
                        .padding(.trailing, 10)
                        .padding(.leading, 10)
                        .padding(.top, 4)
                        .padding(.bottom, 4)
                    }


                } // V Stack
                .background(
                    Image(uiImage: (segmentNumber == 0 ?
                            UIImage(imageLiteralResourceName: "apexWhite") :
                        UIImage(data: $viewModel.remoteImageData.wrappedValue[($viewModel.acc.wrappedValue.data?.segments?[segmentNumber].metadata?.name)!]! )!
                        ) )
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

}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(AccountViewModel())
    }
}

