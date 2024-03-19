//
//  HiringDataModel.swift
//  fetchHiring
//
//  Created by Yi Ling on 3/19/24.
//

import Foundation

class HiringDataList: Identifiable, Decodable{
    var resultList: [SingleHiringData] = []
    
    init(){
        downloadHiringData{ results in
            self.resultList = results
        }
    }
}

class SingleHiringData: Identifiable, Decodable, Comparable{
    var id: Int?
    var listId: Int?
    var name: String?
    
    private enum CodingKeys: String, CodingKey{
        case id = "id",
             listId = "listId",
             name = "name"
    }
    
    static func < (lhs: SingleHiringData, rhs: SingleHiringData) -> Bool{
        if lhs.listId != rhs.listId{
            return lhs.listId ?? 0 < rhs.listId ?? 0
        } else {
            return lhs.name ?? "" < rhs.name ?? ""
        }
    }
    
    static func == (lhs: SingleHiringData, rhs: SingleHiringData) -> Bool {
        if lhs.id == rhs.id && lhs.name == rhs.name{
            return true
        }
        return false
    }
}
