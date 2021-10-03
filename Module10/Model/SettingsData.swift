//
//  SettingsData.swift
//  Module10
//
//

import Foundation
import MapKit

struct SettingsData {
    let settingsArray: [[SettingsItem]]
}

struct SettingsItem {
    let type: String
    let name: String
    let icon: String
    let textLabel: String
    let switcher: Bool
    let disclosureIndicator: Bool
}

// MARK: - Support for loading SettingsData from plist
extension SettingsData {
    static var defaultSettingsData: [[SettingsItem]] = {
        return loadCatalogFromPlistNamed("task2settings")
    }()
    
    static func loadCatalogFromPlistNamed(_ plistName: String) -> [[SettingsItem]] {
        guard
          let path = Bundle.main.path(forResource: plistName, ofType: "plist"),
          let dictArray = NSArray(contentsOfFile: path) as? [[[String : AnyObject]]]
          else {
            fatalError("An error occurred while reading \(plistName).plist")
        }
        
        var dataArray: [[SettingsItem]] = []
        
        for el in dictArray {
            var eldataArray: [SettingsItem] = []
        for dict in el {
            guard
                let type = dict["type"] as? String,
                let name = dict["name"] as? String,
                let icon = dict["icon"] as? String,
                let textLabel = dict["textLabel"] as? String,
                let switcher = dict["switcher"] as? Bool,
                let disclosureIndicator = dict["disclosureIndicator"] as? Bool
                else {
                  fatalError("Error parsing dict \(dict)")
              }
            
            let setItem = SettingsItem (type: type, name: name, icon: icon, textLabel: textLabel, switcher: switcher, disclosureIndicator: disclosureIndicator)
            eldataArray.append(setItem)
            }
            dataArray.append(eldataArray)
        }
    return dataArray
    }
}
