//
//  SharedPreferance.swift
//  App360
//
//  Created by MD Abir Hosssain on 31/10/21.
//  Copyright © 2021 MD Abir Hosssain. All rights reserved.
//

import Foundation
import SwiftUI

let PrefMgr = PreferenceManager.shared


class PreferenceManager: NSObject {
    
    static var shared : PreferenceManager = PreferenceManager()
    
    override init() {
        super.init()
    }
    
    func synchronize() {
        let userDefault = UserDefaults.standard
        userDefault.synchronize()
    }
    
    func setPref(_ value : Any?, forKey prefKey:String) {
        let userDefault = UserDefaults.standard
        if let _ = value {
            userDefault.setValue(value, forKey: prefKey)
        } else {
            userDefault.removeObject(forKey: prefKey)
        }
    }
    
    func setPref(value:Bool,forKey prefKey:String) {
        let userDefault = UserDefaults.standard
        userDefault.set(value, forKey: prefKey)
    }
    
    func exist(forKey prefKey: String)-> Bool {
        let userDefault = UserDefaults.standard
        return (userDefault.object(forKey: prefKey) != nil)
    }
    
    func pref(forKey prefKey:String) -> Any? {
        let userDefault = UserDefaults.standard
        return userDefault.object(forKey: prefKey)
    }
    
    func removeObject(forKey prefkey: String) {
        let userDefault = UserDefaults.standard
        userDefault.removeObject(forKey: prefkey)
    }

}

//extension PreferenceManager {
//    
//    var notes: [Note]? {
//        get {
//            
//            if let objects = UserDefaults.standard.value(forKey: Constant.Keys.notesKeys) as? Data {
//                
//                     let decoder = JSONDecoder()
//                     if let objectsDecoded = try? decoder.decode([Note].self, from: objects) as [Note] {
//                        return objectsDecoded
//                     } else {
//                        
//                        return nil
//                     }
//                  } else {
//                    
//                     return nil
//                  }
//        }
//        set (notes){
//            let encoder = JSONEncoder()
//            if let encoded = try? encoder.encode(notes){
//                self.setPref(encoded, forKey: Constant.Keys.notesKeys)
//            }
//            
//        }
//        
//    }
//    
//    var notesObj: [Note]? {
//        get {
//            
//            if let objects = UserDefaults.standard.value(forKey: Constant.Keys.notesKeys) as? Data {
//                
//                     let decoder = JSONDecoder()
//                     if let objectsDecoded = try? decoder.decode([Note].self, from: objects) as [Note] {
//                        return objectsDecoded
//                     } else {
//                        
//                        return nil
//                     }
//                  } else {
//                    
//                     return nil
//                  }
//        }
//        set (notes){
//            let encoder = JSONEncoder()
//            if let encoded = try? encoder.encode(notes){
//                self.setPref(encoded, forKey: Constant.Keys.notesKeys)
//            }
//            
//        }
//        
//    }
//    
//}



extension UserDefaults {

   func save<T:Encodable>(customObject object: T, inKey key: String) {
       let encoder = JSONEncoder()
       if let encoded = try? encoder.encode(object) {
           self.set(encoded, forKey: key)
       }
   }

   func retrieve<T:Decodable>(object type:T.Type, fromKey key: String) -> T? {
       if let data = self.data(forKey: key) {
           let decoder = JSONDecoder()
           if let object = try? decoder.decode(type, from: data) {
               return object
           }else {
               print("Couldnt decode object")
               return nil
           }
       }else {
           print("Couldnt find key")
           return nil
       }
   }

}

