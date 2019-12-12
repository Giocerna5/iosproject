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
    @EnvironmentObject var sessionController: SessionController
    
    @State var segmentNumber : Int = 0
    @State var menuOpen: Bool = false
    
    var body: some View {
        VStack {
            ZStack {

            HStack {
                Spacer()
                VStack {
                    
                    HStack {
                        Button(action: {
                                self.openMenu()
                            }, label: {
                                Text("Open")                            .foregroundColor(.white)
                                    .font(.system(size: 20))
                        })
                        Spacer()
                        Text((self.$viewModel.acc.wrappedValue
                            .data?.platformInfo?.platformUserHandle?.uppercased() ?? "nil") )
                            .foregroundColor(Color.init(red: 179.0, green: 0.0, blue: 0.0))
                            .font(.system(size: 25))
                        Spacer()
                        Text("XBOX")
                            .foregroundColor(.white)
                            .font(.system(size: 20))

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

                    
                SideMenu(width: 270,
                        isOpen: self.menuOpen,
                        menuClose: self.openMenu)
                }
        } //V stack
        .background(Color.black.edgesIgnoringSafeArea(.all))
            .onAppear(perform: self.loadData)
    } // body
    
    func loadData(){
        self.sessionController.getUserInfo(email: self.$sessionController.session.wrappedValue?.email ?? "no email") {
            
            print("hello")
            self.viewModel.load(platform: "xbl", handle: self.$sessionController.dbResult.wrappedValue["xbox"] ?? "nada")
        }
        
    }
    func openMenu() {
        self.menuOpen.toggle()
    }

    struct MenuContent: View {
        @EnvironmentObject var sessionController: SessionController
        let width: CGFloat
        
        var body: some View {
                VStack {
                    Button(action: self.signOut){
                        Spacer()
                        Text("Logout").foregroundColor(.white).font(.system(size: 20))
                        Spacer()
                    }.background(Color.init(red: 179.0, green: 0.0, blue: 0.0))
                    .cornerRadius(10)
                    .padding(5)
                    Spacer()
                }
        } //body
        func signOut() {
            sessionController.signOut()
        }
    }

    struct SideMenu: View {
        let width: CGFloat
        let isOpen: Bool
        let menuClose: () -> Void
        
        var body: some View {
            ZStack {
                GeometryReader { _ in
                    EmptyView()
                }
                .background(Color.gray.opacity(0.3))
                .opacity(self.isOpen ? 1.0 : 0.0)
                .animation(Animation.easeIn.delay(0.25))
                .onTapGesture {
                    self.menuClose()
                }
                
                HStack {
                    MenuContent(width: self.width)
                        .frame(width: self.width)
                        .background(Color.init(red: 0.3, green: 0.3, blue: 0.3))
                        .offset(x: self.isOpen ? 0 : -self.width)
                        .animation(.default)
                    
                    Spacer()
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(AccountViewModel())
    }
}
