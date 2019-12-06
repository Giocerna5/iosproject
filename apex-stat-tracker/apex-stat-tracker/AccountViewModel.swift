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
    @Published var remoteImageData: Data = Data();
    
    func load() {
        guard let url = URL(string: "https://public-api.tracker.gg/v2/apex/standard/profile/xbl/mckcidatae") else { return }
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
                    self.loadImage(imageURL: self.acc.data?.segments?[1].metadata?.tallImageURL ?? "No Image")
                }
            } catch {
                print("Failed To decode: ", error)
            }
        }.resume()
        
        
    }
    
    func loadImage(imageURL: String){
        guard let url = URL(string: imageURL) else { return }
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        request.setValue("bf855cd1-b17a-4813-937f-302f6a7b3cdc", forHTTPHeaderField: "TRN-Api-Key")
        
        URLSession(configuration: URLSessionConfiguration.default).dataTask(with: request) { (data, response, error) in
            do {
                print(response as Any)
                guard let data = data else { return }
                print(data)
                DispatchQueue.main.async {
                    self.remoteImageData = data;
                    //self.acc.ReloadObj()
                }
            } catch {
                print("Failed To decode: ", error)
            }
        }.resume()
    }
}
