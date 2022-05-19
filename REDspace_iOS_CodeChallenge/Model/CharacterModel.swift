//
//  CharacterModel.swift
//  REDspace_iOS_CodeChallenge
//
//  Created by Harsh on 17/05/22.
//

import Foundation
// MARK: - Characters
struct Characters: Codable {
    let info: Info
    let results: [Result]
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int?
    let next,prev: String?
}

// MARK: - Result
struct Result: Codable {
    let id: Int?
    let name,species,type,image,url,created: String?
    let status: Status
    let gender: Gender
    let origin, location: Location
    let episode: [String?]
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}
enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
