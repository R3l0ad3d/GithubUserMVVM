//
//  UserCell.swift
//  GithubUser
//
//  Created by Azizur Rahman on 19/1/23.
//

import SwiftUI

struct UserCell: View {
    @State var url : URL? = URL(string: "https://hws.dev/paul.jpg")
    @State var name : String = "@ Joy reloaded"
    @State var user : GithubUser
    var body: some View {
        HStack{
            if let avater = URL(string: user.avatarURL){
                CachedAsyncImage(url: avater ) { image in
                    image.resizable()
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40,height: 40)
                
                } placeholder: {
                    Image("person")
                        .resizable()
                        .frame(width: 40,height: 40)
                }
            }else{
                Image("person")
                    .resizable()
                    .frame(width: 40,height: 40)
            }
            
            Text(user.login)
                .bold()
                .font(.title2)
            Spacer()
        }
    }
}

//struct UserCell_Previews: PreviewProvider {
//    static var previews: some View {
//        UserCell()
//    }
//}
