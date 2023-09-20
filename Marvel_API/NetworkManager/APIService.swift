//
//  APIService.swift
//  Marvel_API
//
//  Created by Евангелина Клюкай on 01.08.2022.
//

import Foundation
import Alamofire
import CryptoKit

class APIService {
    
    func getCharacters(completion: @escaping ([CharacterModel]) -> Void, onFail: ((Error) -> Void)?) {
        
        let timestamp = "\(Date().timeIntervalSince1970)"
        let hash = stringToMD5(string: "\(timestamp)\(MARVEL_PRIVATE_KEY)\(MARVEL_PUBLIC_KEY)")
        
        AF.request("https://gateway.marvel.com/v1/public/characters?ts=\(timestamp)&apikey=\(MARVEL_PUBLIC_KEY)&hash=\(hash)").responseJSON { response in
            switch response.result {
            case .success(let data):
                guard let json = data as? [String: Any] else {
                    print("Unable to parse response")
                    return
                }
                guard let data = json["data"] as? [String: Any] else {
                    print("Unable to find data")
                    return
                }
                guard let results = data["results"] as? [[String: Any]] else {
                    print("Unable to find results")
                    return
                }
                
                let characters = results.map({ CharacterModel(data: $0) })
                completion(characters)
                
            case .failure(let error):
                print(error.localizedDescription)
                onFail?(error)
            }
        }
    }
    
    func stringToMD5(string: String) -> String {
        let data = string.data(using: .utf8)!
        let digest = Insecure.MD5.hash(data: data)
        let hexString = digest.map { String(format: "%02hhx", $0) }.joined()
        return hexString
    }
    
}
