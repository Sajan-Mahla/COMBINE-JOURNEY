//
//  GitHubUser.swift
//  GitHubUser
//
//  Created by SAJAN  on 21/11/25.
//

struct GitHubUser: Decodable {
    let login: String
    let avatar_url: String
    let followers: Int
    let following: Int
}
