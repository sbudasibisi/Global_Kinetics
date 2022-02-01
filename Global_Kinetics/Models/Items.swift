

import Foundation
struct Items : Codable {
	let tags : [String]?
	let owner : Owner?
	let is_answered : Bool?
	let view_count : Int?
	let answer_count : Int?
	let score : Int?
	let last_activity_date : Int?
	let creation_date : Int?
	let last_edit_date : Int?
	let question_id : Int?
	let content_license : String?
	let link : String?
	let title : String?

	enum CodingKeys: String, CodingKey {

		case tags = "tags"
		case owner = "owner"
		case is_answered = "is_answered"
		case view_count = "view_count"
		case answer_count = "answer_count"
		case score = "score"
		case last_activity_date = "last_activity_date"
		case creation_date = "creation_date"
		case last_edit_date = "last_edit_date"
		case question_id = "question_id"
		case content_license = "content_license"
		case link = "link"
		case title = "title"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		tags = try values.decodeIfPresent([String].self, forKey: .tags)
		owner = try values.decodeIfPresent(Owner.self, forKey: .owner)
		is_answered = try values.decodeIfPresent(Bool.self, forKey: .is_answered)
		view_count = try values.decodeIfPresent(Int.self, forKey: .view_count)
		answer_count = try values.decodeIfPresent(Int.self, forKey: .answer_count)
		score = try values.decodeIfPresent(Int.self, forKey: .score)
		last_activity_date = try values.decodeIfPresent(Int.self, forKey: .last_activity_date)
		creation_date = try values.decodeIfPresent(Int.self, forKey: .creation_date)
		last_edit_date = try values.decodeIfPresent(Int.self, forKey: .last_edit_date)
		question_id = try values.decodeIfPresent(Int.self, forKey: .question_id)
		content_license = try values.decodeIfPresent(String.self, forKey: .content_license)
		link = try values.decodeIfPresent(String.self, forKey: .link)
		title = try values.decodeIfPresent(String.self, forKey: .title)
	}

}
