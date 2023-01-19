//
//  ContentView.swift
//  GithubUser
//
//  Created by Azizur Rahman on 19/1/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm : UserViewModel = UserViewModel()
    var body: some View {
        NavigationView {
            List(vm.userList) { user  in
                NavigationLink {
                    UserDetailsView(url: user.htmlURL)
                } label: {
                    UserCell(user: user)
                }
                
            }.listStyle(.plain)
            .navigationTitle("Github DM")
            .navigationBarTitleDisplayMode(.automatic)
            .task {
                await vm.loadUser()
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
