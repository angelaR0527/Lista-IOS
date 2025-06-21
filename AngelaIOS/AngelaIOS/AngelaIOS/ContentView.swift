//
//  ContentView.swift
//  AngelaIOS
//
//  Created by ANGELA ROGEL GONZALEZ on 19/1/25.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUserName = 0
    @State private var wrongPassword = 0
    @State private var showLoginScreen = false
    
    var body: some View {
        NavigationView{
            ZStack{
                // Ciculos decorativos
                Color.purple
                    .opacity(0.5)
                    .ignoresSafeArea()
                Circle()
                    .scale(1.9)
                    .foregroundColor(.white.opacity(0.25))
                Circle()
                    .scale(1.65)
                    .foregroundColor(.white.opacity(0.35))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                
                VStack{
                    Text("Inicio de sesión")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Nombre de usuario", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUserName))
                        
                    SecureField("Contraseña", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    Button("Login"){
                        authentication(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 100, height: 50)
                    .background(Color.purple.opacity(0.35))
                    .cornerRadius(10)
                    
                    NavigationLink(destination: TareaTableView(username: $username), isActive: $showLoginScreen){
                        EmptyView()
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    func authentication(username: String, password: String){
        if username.lowercased() == "admin" {
            wrongUserName = 0
            if password.lowercased() == "123" {
                wrongPassword = 0
                showLoginScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUserName = 2
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
