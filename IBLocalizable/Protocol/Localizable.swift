//
//  Localizable.swift
//  IBLocalizable
//
//  Created by Chris Jimenez on 7/29/16.
//  Copyright © 2016 Chris Jimenez. All rights reserved.
//

import Foundation
import UIKit

/**
 *  Localizable Protocol
 */
public protocol Localizable: class {
    
    /// The property that can be localized for each view, for example in a UILabel its the text, in a UIButton its the title, etc
    var localizableProperty: String? { get set }
    
    /// The localizable string value in the your localizable strings
    var localizableString: String { get set }
    
    /**
     Applies the localizable string to the supported view attribute
     */
    func applyLocalizableString(_ localizableString: String?) -> Void
    
}


extension Localizable{
    
    /**
     Applies the localizable string to the supported view attribute
     
     - parameter localizableString: localizable String Value
     */
    public func applyLocalizableString(_ localizableString: String?) -> Void {
        
        self.localizableProperty = localizableString?.localized
        
    }
}

public final class  IBLocalizableSettings{
    
    var bundle:Bundle!
    
    public static func setLanguage(lang:String)
    {
        UserDefaults.standard.set(lang, forKey: "IBLocalizableLang")
        UserDefaults.standard.synchronize()
        sharedInstance.reloadLang()
    }
    
    // Can't init is singleton
    private init() {
        reloadLang()
    }
    
    public func reloadLang(){
        var path:String?
        if let langKey=UserDefaults.standard.string(forKey: "IBLocalizableLang")
        {
            path=Bundle.main.path(forResource: langKey, ofType: "lproj")
        }
        if(path != nil)
        {
            bundle = Bundle(path: path!)!
        }
        else
        {
            bundle = Bundle.main
        }
    }
    //MARK: Shared Instance
    
    static let sharedInstance: IBLocalizableSettings = IBLocalizableSettings()
    
    //MARK: Local Variable
    
    
   
    
}

