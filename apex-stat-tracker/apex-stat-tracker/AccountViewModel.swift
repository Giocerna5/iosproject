//
//  AccountViewModel.swift
//  apex-stat-tracker
//
//  Created by Guillermo Che on 11/26/19.
//  Copyright © 2019 webHead. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

public class AccountViewModel : ObservableObject {
    
    @Published var acc: Account = Account(data: nil, reload: false);
    @Published var remoteImageData: [String:Data] = [:];
    
    func load() {
        guard let url = URL(string: "https://public-api.tracker.gg/v2/apex/standard/profile/xbl/mckujo") else { return }
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        request.setValue("bf855cd1-b17a-4813-937f-302f6a7b3cdc", forHTTPHeaderField: "TRN-Api-Key")
        
        URLSession(configuration: URLSessionConfiguration.default).dataTask(with: request) { (data, response, error) in
            do {
                print(response as Any)
                guard let data = data else { return }
                print(data)
                print("start")
                let account : Account = try JSONDecoder().decode(Account.self, from: data)
                print("done")
                DispatchQueue.main.async {
                    self.acc = account
                    
                    guard let segArray = self.acc.data?.segments else { return }
                    
                    segArray.forEach { segment in
                        guard let meta = segment.metadata else { return }
                        self.loadImage(imageURL: meta.tallImageURL ?? "No Image", key: meta.name!)
                    }

                }
            } catch {
                print("Failed To decode: ", error)
            }
        }.resume()
        
        
    }
    
    func loadImage(imageURL: String, key: String){
        guard let url = URL(string: imageURL) else { return }
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        request.setValue("bf855cd1-b17a-4813-937f-302f6a7b3cdc", forHTTPHeaderField: "TRN-Api-Key")
        print("hello")
        URLSession(configuration: URLSessionConfiguration.default).dataTask(with: request) { (data, response, error) in
                print(response as Any)
                guard let data = data else { return }
                print(data)
                DispatchQueue.main.async {
                    self.remoteImageData[key] = data
                }
        }.resume()
    }
}
