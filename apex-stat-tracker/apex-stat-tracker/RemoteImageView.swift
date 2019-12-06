//
//  ImageViewModel.swift
//  apex-stat-tracker
//
//  Created by Guillermo Che on 11/29/19.
//  Copyright © 2019 webHead. All rights reserved.
//

import Foundation
import SwiftUI

struct RemoteImageView: View {
    @State var remoteImage : RemoteImage = RemoteImage(imageURL: "")
    @State var imageURL: String = ""
    
    init(imageURL: String, imageLiteral: String){
        self.remoteImage = RemoteImage(imageURL: imageURL)
        self.imageURL = imageURL
    }
    
    var body: some View {
        Image(uiImage: remoteImage.data.isEmpty || !imageURL.starts(with: "http") ? remoteImage.data.isEmpty ? UIImage(imageLiteralResourceName: "lifeline-profile") : UIImage(data: remoteImage.data)! : UIImage(data: remoteImage.data)! )
                .resizable()
                .frame(width: CGFloat(100), height: CGFloat(100))
    }
}
