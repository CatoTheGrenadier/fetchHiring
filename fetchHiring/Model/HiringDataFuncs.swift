//
//  HiringDataFuncs.swift
//  fetchHiring
//
//  Created by Yi Ling on 3/19/24.
//

import Foundation

func downloadHiringData(completed: @escaping ([SingleHiringData]) -> ()){ // This function downloads and trimmed the json data
    let url = URL(string:"https://fetch-hiring.s3.amazonaws.com/hiring.json")
    URLSession.shared.dataTask(with: url!){ (data, response, err) in
        if err == nil {
            guard let jsondata = data else {return}
            do{
                var results = try JSONDecoder().decode([SingleHiringData].self, from: jsondata)
                results.removeAll { singleData in
                    return singleData.name == nil || singleData.name == ""
                }
                results.sort()
                print("JSON successfully grabbed!")
                DispatchQueue.main.async{
                    completed(results)
                }
            } catch {
                print("JSON decodinging error!")
            }
        } else {
            print("JSON downloading error!")
        }
    }.resume()
}
