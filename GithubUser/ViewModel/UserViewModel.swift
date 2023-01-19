//
//  UserViewModel.swift
//  GithubUser
//
//  Created by Azizur Rahman on 20/1/23.
//

import SwiftUI

class UserViewModel : ObservableObject {
    @Published var userList : [GithubUser] = []
    
    func loadUser() async{
        guard let url = URL(string: APICore.GITHUB_USER) else {return}
        let urlRequest = URLRequest(url: url)
        do{
            let (data, _ ) = try await URLSession.shared.data(for: urlRequest)
            if let users = try? JSONDecoder().decode(GithubUserResponse.self, from: data){
                userList = users
            }
        }catch{
            print(error.localizedDescription)
        }
    }
    func load(){
        guard let url = URL(string: APICore.GITHUB_USER) else {return}
        let urlRequest = URLRequest(url: url)
        do{
            URLSession.shared.dataTask(with: urlRequest) { data , response , error in
                if let error = error{
                    print(error.localizedDescription)
                    return
                }
                if let data = data, let users = try? JSONDecoder().decode(GithubUserResponse.self, from: data){
                    self.userList = users
                    print(users.count)
                }
            }.resume()
        }
    }
}
