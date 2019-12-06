//
//  StatsList.swift
//  apex-stat-tracker
//
//  Created by Guillermo Che on 11/30/19.
//  Copyright © 2019 webHead. All rights reserved.
//

import SwiftUI

struct StatsList: View {
    
    @EnvironmentObject var viewModel: AccountViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 40) {
//self.$viewModel.acc.wrappedValue.data?.segments?.isEmpty ?
//    Image() : Image()
            if self.$viewModel.acc.wrappedValue.reload ?? true {
                self.$viewModel.acc.wrappedValue.data.map{_ in
                    AccData()
                }
            }
            else {
                GeometryReader { g in                 Text("Loading...").foregroundColor(.white)
                    .frame(width: g.size.width)
                }
            }

        }.background(Color.init(red: 0.5, green: 0.5, blue: 0.5).opacity(0.2))
    }
    func AccData() -> TempList {
        guard let data = self.$viewModel.acc.wrappedValue.data?.segments?[0].stats else{
            return TempList(map: [:])
        }
        let mapping : [String:String] = [
            data.level?.displayName ?? "1": data.level?.displayValue ?? "nil",
            data.kills?.displayName ?? "2": data.kills?.displayValue ?? "nil",
            data.finishers?.displayName ?? "3": data.finishers?.displayValue ?? "nil",
            data.carePackageKills?.displayName ?? "4": data.carePackageKills?.displayValue ?? "nil",
            data.season2WINS?.displayName ?? "5": data.season2WINS?.displayValue ?? "nil",
            data.rankScore?.displayName ?? "6": data.rankScore?.displayValue ?? "nil",
            data.bombardmentKills?.displayName ?? "7": data.bombardmentKills?.displayValue ?? "nil",
            data.seasonWINS?.displayName ?? "8": data.seasonWINS?.displayValue ?? "nil",
            data.season3WINS?.displayName ?? "9": data.season3WINS?.displayValue ?? "nil",
            data.damage?.displayName ?? "10": data.damage?.displayValue ?? "nil",
            data.headshots?.displayName ?? "11": data.headshots?.displayValue ?? "nil",
            data.eyeEnemiesScanned?.displayName ?? "12": data.eyeEnemiesScanned?.displayValue ?? "nil",
            data.winningKills?.displayName ?? "13": data.winningKills?.displayValue ?? "nil",
        ]
        return TempList(map: mapping)
    }
    
    struct TempList: View {
        var keys : [String]
        var values : [String]
        
        init(map: [String:String]){
            self.keys = map.map{$0.key}
            self.values = map.map{$0.value}
        }
        var body: some View{
            ForEach(keys.indices) { idx in
                if self.values[idx] != "nil"{
                    StatsRow(title: self.keys[idx], value: self.values[idx], valid: true)
                }
            }
        }
    }
}

struct StatsList_Previews: PreviewProvider {
    static var previews: some View {
        StatsList().environmentObject(AccountViewModel())
    }
}
