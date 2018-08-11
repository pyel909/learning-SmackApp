//
//  MessageService.swift
//  Smack
//
//  Created by pyel on 11/08/2018.
//  Copyright © 2018 pyel. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    
    static let instance = MessageService()
        
    var channels = [Channel]()
        
    func findAllChannels (completion: @escaping CompletionHandler) {
        
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER_AUTHORIZATION).responseJSON { (response) in
            
            if response.result.error == nil {
                guard let data = response.data else { return }
                
                do {
                    self.channels = try JSONDecoder().decode([Channel].self, from: data)
                } catch let error {
                    debugPrint(error as Any)
                    
                }
                print(self.channels)
                
//                if let json = try! JSON(data: data).array {
//                    for item in json {
//                        let channelName = item["name"].stringValue
//                        let channelDescription = item["description"].stringValue
//                        let channelID = item["_id"].stringValue
//                        let channel = Channel(channelTitle: channelName, channelDescription: channelName, channelID: channelID)
//                        self.channels.append(channel)
//                    }
//                    completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
