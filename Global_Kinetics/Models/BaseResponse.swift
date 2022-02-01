
import Foundation
struct BaseResponse : Codable {
	let items : [Items]?
	let has_more : Bool?
	let quota_max : Int?
	let quota_remaining : Int?

	enum CodingKeys: String, CodingKey {

		case items = "items"
		case has_more = "has_more"
		case quota_max = "quota_max"
		case quota_remaining = "quota_remaining"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		items = try values.decodeIfPresent([Items].self, forKey: .items)
		has_more = try values.decodeIfPresent(Bool.self, forKey: .has_more)
		quota_max = try values.decodeIfPresent(Int.self, forKey: .quota_max)
		quota_remaining = try values.decodeIfPresent(Int.self, forKey: .quota_remaining)
	}

}
