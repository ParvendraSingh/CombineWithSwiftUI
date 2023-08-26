//
//  DetailsView.swift
//  CombineWithSwiftUI
//
//  Created by Parvendra Kumar on 25/08/23.
//

import SwiftUI

struct DetailsView: View {
    
    var user: UserModel
    
    var body: some View {
        VStack {
            Image("userImage")
                .resizable()
                .frame(height: 200)
                .scaledToFit()
            Text(user.name ?? "")
            Text(user.address?.city ?? "")
            Spacer()
        }
        .padding()
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(user: UserViewModel().userArray.first!)
    }
}
