//
//  ContentView.swift
//  CombineWithSwiftUI
//
//  Created by Parvendra Kumar on 25/08/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        
        NavigationView {
            ZStack {
                List(viewModel.userArray, id: \.id) { user in
                    NavigationLink {
                        DetailsView(user: user)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(user.name ?? "")
                                .font(.headline)
                            Text("City : \(user.address?.city ?? ""), Pin: \(user.address?.zipcode ?? "")")
                                .font(.subheadline)
                        }
                    }
                }
                if viewModel.loading {
                    CustomLoader()
                }
            }
            .navigationBarTitle("Users")
        }
        .onAppear {
            viewModel.getUserData()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
