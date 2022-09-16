//
//  PasswordGeneratorController.swift
//  PassGenerator
//
//  Created by David Edson on 02.09.22.
//

import Foundation
import UIKit

class PasswordGeneratorController: ObservableObject {
    
    var passwordStr = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_-+={[}]|:;<,>.?/"
    
    func GeneratePassword(numberOfString: Int) -> String {
        return String((0..<numberOfString).map{ _ in passwordStr.randomElement()! })
    }
}
