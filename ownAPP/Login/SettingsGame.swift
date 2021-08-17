//
//  SettingsGame.swift
//  ownAPP
//
//  Created by Ihor Shovkoplias on 16.08.2021.
//

import Foundation

//struct SettingsGame:Decodable, Encodable {||
//Codable is super protocol for Decodable, Encodable

enum KeysUserFefaults{
   static let settingsGame = "SettingsGame"
}

struct SettingsGame: Codable {
    var timerState:Bool
    var timeforGame:Int
    
}

class Settings{
    
    static var shared = Settings()
    let defaultSettingsGame = SettingsGame(timerState: true, timeforGame: 30)
    
    var curentSettings:SettingsGame{
        get{
            if let data = UserDefaults.standard.object(forKey: KeysUserFefaults.settingsGame) as? Data{
                return try! PropertyListDecoder().decode(SettingsGame.self, from: data)
            }
            
            if let data = try? PropertyListEncoder().encode(defaultSettingsGame){
            UserDefaults.standard.setValue(data, forKey: KeysUserFefaults.settingsGame)
            }
            self.curentSettings = defaultSettingsGame
            
            return defaultSettingsGame
            
            
            
        }
        set{
            do{
                let data =  try PropertyListEncoder().encode(newValue)
                UserDefaults.standard.setValue(data, forKey: KeysUserFefaults.settingsGame)
            }catch{
                print(error)
            }
        }
    }
}
