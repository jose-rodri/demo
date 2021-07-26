
import Foundation
import Alamofire

// MARK: - Users
struct Users: Codable {
    let results: [UserResult]?
  
}

struct Info: Codable {
    let seed: String?
    let results, page: Int?
    let version: String?
}

struct UserResult: Codable {
    let gender: String?
    let name: Name?
    let location: Location?
    let email: String?
    //let login: Login?
    let dob, registered: Dob?
    let phone, cell: String?
    //let id: ID?
    let picture: Picture?
    let nat: String?
}

struct Dob: Codable {
    let date: String?
    let age: Int?
}

struct ID: Codable {
    let name, value: String?
}

struct Location: Codable {
    let street: Street?
    let city, state, country: String?
    //let postcode: Int?
    let coordinates: Coordinates?
    //let timezone: Timezone?
}

struct Coordinates: Codable {
    let latitude, longitude: String?
}

struct Street: Codable {
    let number: Int?
    let name: String?
}

struct Timezone: Codable {
    let offset, timezoneDescription: String?

    enum CodingKeys: String, CodingKey {
        case offset
        case timezoneDescription
    }
}

struct Login: Codable {
    let uuid, username, password, salt: String?
    let md5, sha1, sha256: String?
}
struct Name: Codable {
    let title, first, last: String?
}

struct Picture: Codable {
    let large, medium, thumbnail: String?
}




