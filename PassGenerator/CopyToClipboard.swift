//
//  CopyToClipboard.swift
//  PassGenerator
//
//  Created by David Edson on 02.09.22.
//

import Foundation
import UIKit

class CopyToClipboard: ObservableObject {
    
    var contentView = ContentView()
    
    func copyToClipboard() {
        self.contentView.pasteboard.string = self.contentView.text
        self.contentView.text = ""
        self.contentView.buttonText = "Copied!"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.contentView.buttonText = "Copy"
        }
    }
}
