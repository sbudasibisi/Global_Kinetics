
import Foundation
struct Owner : Codable {
	let account_id : Int?
	let reputation : Int?
	let user_id : Int?
	let user_type : String?
	let profile_image : String?
	let display_name : String?
	let link : String?

	enum CodingKeys: String, CodingKey {

		case account_id = "account_id"
		case reputation = "reputation"
		case user_id = "user_id"
		case user_type = "user_type"
		case profile_image = "profile_image"
		case display_name = "display_name"
		case link = "link"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		account_id = try values.decodeIfPresent(Int.self, forKey: .account_id)
		reputation = try values.decodeIfPresent(Int.self, forKey: .reputation)
		user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
		user_type = try values.decodeIfPresent(String.self, forKey: .user_type)
		profile_image = try values.decodeIfPresent(String.self, forKey: .profile_image)
		display_name = try values.decodeIfPresent(String.self, forKey: .display_name)
		link = try values.decodeIfPresent(String.self, forKey: .link)
	}

}
