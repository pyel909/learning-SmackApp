//
//  UserDataService.swift
//  Smack
//
//  Created by pyel on 06/08/2018.
//  Copyright © 2018 pyel. All rights reserved.
//

import Foundation
class UserDataService {
    
    static let instance = UserDataService()
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func setUserData(id: String, avatarColor: String, avatarName: String, email: String, name: String) {
        self.id = id
        self.avatarColor = avatarColor
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
    
    func returnUIColor(components: String) -> UIColor {
//        "[0.807843137254902, 0.470588235294118, 0.686274509803922, 1]"
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        var redColor, greenColor, blueColor, alphaColor : NSString?
        
        scanner.scanUpToCharacters(from: comma, into: &redColor)
        scanner.scanUpToCharacters(from: comma, into: &greenColor)
        scanner.scanUpToCharacters(from: comma, into: &blueColor)
        scanner.scanUpToCharacters(from: comma, into: &alphaColor)
        
        let defaultColor = UIColor.lightGray
        
        guard let redColorUnwrapped = redColor else { return defaultColor }
        guard let greenColorUnwrapped = greenColor else { return defaultColor }
        guard let blueColorUnwrapped = blueColor else { return defaultColor }
        guard let alphaColorUnwrapped = alphaColor else { return defaultColor }
        
        let redColorFloat = CGFloat(redColorUnwrapped.doubleValue)
        let greenColorFloat = CGFloat(greenColorUnwrapped.doubleValue)
        let blueColorFloat = CGFloat(blueColorUnwrapped.doubleValue)
        let alphaColorFloat = CGFloat(alphaColorUnwrapped.doubleValue)
        
        let newUIColor = UIColor(red: redColorFloat, green: greenColorFloat, blue: blueColorFloat, alpha: alphaColorFloat)
        
        return newUIColor
        
    }
    
    func logoutUser() {
        id = ""
        avatarColor = ""
        avatarName = ""
        email = ""
        name = ""
        AuthService.instance.isLoggedIn = false
        AuthService.instance.userEmail = ""
        AuthService.instance.authToken = ""
        
    }
    
}
