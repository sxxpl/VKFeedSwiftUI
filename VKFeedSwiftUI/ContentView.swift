
//
//  ContentView.swift
//  VKFeedSwiftUI
//
//  Created by Артем Тихонов on 06.11.2022.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var login = ""
    
    @State private var password = ""
    
    @State private var shouldShowLogo: Bool = true
    
    private let keyboardIsOnPublisher = Publishers.Merge( NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
    .map { _ in true }, NotificationCenter.default.publisher(for:
    UIResponder.keyboardWillHideNotification)
        .map { _ in false }
    )
    .removeDuplicates()
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in Image("asd")
                    .resizable()
                    .edgesIgnoringSafeArea(.all) .aspectRatio(contentMode: .fill) .frame(maxWidth: geometry.size.width, maxHeight:
                                                                                            geometry.size.height)
            }
            ScrollView{
                VStack {
                    if shouldShowLogo {
                        Text("Weather App ") .font(.largeTitle) .padding(.top, 32)
                    }
                    VStack {
                        HStack {
                            Text("Login:").bold()
                            Spacer()
                            TextField("", text: $login)
                                .frame(maxWidth: 150)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        HStack {
                            Text("Password:").bold()
                            Spacer()
                            SecureField("", text: $password)
                                .frame(maxWidth: 150) .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        Button(action: { print("Hello") }) { Text("Log in").bold()
                        }.padding(.top, 50)
                            .padding(.bottom, 20) .disabled(login.isEmpty || password.isEmpty)
                    }.frame(maxWidth: 250)
                        
                    
                }.padding(.top, 250)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
