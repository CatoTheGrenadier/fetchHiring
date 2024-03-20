//
//  ContentView.swift
//  fetchHiring
//
//  Created by Yi Ling on 3/19/24.
//

import SwiftUI

struct MasterView: View {
    @ObservedObject var hiringData = HiringDataList()
    var body: some View {
        List{
            ForEach(hiringData.resultList, id:\.id){ singleData in
                HStack{
                    Text("listId:")
                        .fontWeight(.bold)
                    +
                    Text(" \(singleData.listId ?? 0)")
                    
                    Spacer()
                    
                    Text("name:")
                        .fontWeight(.bold)
                    +
                    Text(" \(singleData.name ?? "null")")
                    
                    Spacer()
                    
                    Text("Id:")
                        .fontWeight(.bold)
                    +
                    Text(" \(singleData.id ?? 0)")
                }
            }
        }
    }
}

#Preview {
    MasterView()
}
