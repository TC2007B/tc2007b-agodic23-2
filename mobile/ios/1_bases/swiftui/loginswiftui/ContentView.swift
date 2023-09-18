//
//  ContentView.swift
//  loginswiftui
//
//  Created by Denisse Maldonado on 24/08/23.
//

import SwiftUI

struct ContentView: View {
    @State var username: String
    @State var password: String
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            Spacer().frame(height: 60)
            
            TextField("Username", text: $username)
                .padding(.bottom, 15)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .foregroundColor(Color.black)
                .disableAutocorrection(true)
                .keyboardType(.emailAddress)
                // Keyboard appearance helps the user to find email characters easily like @.
                .autocapitalization(.none)
                // Allows the user to use lower case letter at start.
                .multilineTextAlignment(.center)
                .submitLabel(.next)
            Divider()
                .frame(height: 1)
                .padding(.horizontal, 15)
                .background(Color.gray)
            
            SecureField("Password", text: self.$password)
                .padding()
                .background(Color.white)
                .disableAutocorrection(true)
                .multilineTextAlignment(.center)
                .submitLabel(.done)
            Divider()
                .frame(height: 1)
                .padding(.horizontal, 15)
                .background(Color.gray)
                .submitLabel(.done)
            
            Spacer().frame(height: 100)
            
            Button {
                // Perform login
            } label: {
                Text("Login")
                    .font(.headline)
                    .frame(width: 300, height: 25)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(13)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(username: "", password: "")
    }
}
