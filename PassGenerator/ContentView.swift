//
//  ContentView.swift
//  PassGenerator
//
//  Created by David Edson on 02.09.22.
//

import SwiftUI

struct ContentView: View {
    
    let alert = UIAlertController()
    @State var showAlert = false
    @State var numberOfStrings = 8.0
    let pasteboard = UIPasteboard.general
    @StateObject var passGenerator = PasswordGeneratorController()
    @StateObject var copyToClipboard = CopyToClipboard()
    @State var text: String = ""
    @State var buttonText: String = "Copy"
    
    var body: some View {
        VStack {
            Text("PassGenerator")
                .font(.title)
                .bold()
                .padding()
            Spacer()
            Slider(
                value: $numberOfStrings,
                in: 6...8
            )
            .padding()
            .frame(width: 250.0)
            .accentColor(Color("ButtonColor"))
            Text("Number of characters: \(Int(numberOfStrings))")
                .padding()
            Text(text)
                .padding()
            HStack {
                Button(action: {
                    text = passGenerator.GeneratePassword(numberOfString: Int(numberOfStrings))
                }) {
                    Text("Generate Password")
                        .padding()
                        .border(Color("ButtonColor"))
                }
                .foregroundColor(Color("ButtonColor"))
                if text == "" {
                    
                } else {
                    Button(action: {
                        copy()
                    }) {
                        Text(buttonText)
                            .padding()
                            .border(Color("ButtonColor"))
                    }
                    .foregroundColor(Color("ButtonColor"))
                }
            }
            Spacer()
        }
    }
    
    func copy() {
        pasteboard.string = self.text
        self.buttonText = "Copied!"
        self.text = ""
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.buttonText = "Copy"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
