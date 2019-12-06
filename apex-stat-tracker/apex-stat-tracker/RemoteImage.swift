//
//  RemoteImage.swift
//  apex-stat-tracker
//
//  Created by Guillermo Che on 11/29/19.
//  Copyright © 2019 webHead. All rights reserved.
//

import Foundation

public class RemoteImage : ObservableObject {
    
    @Published var data: Data = Data();
    
    init(imageURL: String){
        guard let url = URL(string: imageURL) else { return }
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        request.setValue("bf855cd1-b17a-4813-937f-302f6a7b3cdc", forHTTPHeaderField: "TRN-Api-Key")
        print(data.count)
        URLSession(configuration: URLSessionConfiguration.default).dataTask(with: request) { (data, response, error) in
            do {
                print(data?.count)
                print(response)
                guard let data = data else { return }
                print(data.count)
                print(response)
                DispatchQueue.main.async {
                    self.data = data;
                }
            } catch {
                print("Failed To decode: ", error)
            }
        }.resume()
    }
}
