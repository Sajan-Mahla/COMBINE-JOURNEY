//
//  ContentView.swift
//  GitHubUser
//
//  Created by SAJAN  on 21/11/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = GitHubViewModel()

    var body: some View {
        VStack(spacing: 20) {

            TextField("Search GitHub username…", text: $vm.username)
                .textFieldStyle(.roundedBorder)
                .padding()

            if vm.isLoading {
                ProgressView("Loading…")
            }

            if let user = vm.user {
                VStack(spacing: 10) {
                    AsyncImage(url: URL(string: user.avatar_url)) { img in
                        img.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())

                    Text(user.login)
                        .font(.title2).bold()

                    Text("Followers: \(user.followers)")
                    Text("Following: \(user.following)")
                }
                .padding()
            }

            if let error = vm.errorMessage {
                Text(error).foregroundColor(.red)
            }

            Spacer()
        }
        .padding()
    }
}
