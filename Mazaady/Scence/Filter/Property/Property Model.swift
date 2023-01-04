//
//  Property Model.swift
//  Mazaady
//
//  Created by sameh mohammed on 04/01/2023.
//

import Foundation
// MARK: - Welcome
struct PropertyModel: Codable {
    var code: Int?
    var msg: String?
    var data: PropertyDataClass?
}

// MARK: - DataClass
struct PropertyDataClass: Codable {
    var categories: [Category]?
    var statistics: Statistics?
    var adsBanners: [AdsBanner]?
    var iosVersion, googleVersion, huaweiVersion: String?

    enum CodingKeys: String, CodingKey {
        case categories, statistics
        case adsBanners = "ads_banners"
        case iosVersion = "ios_version"
        case googleVersion = "google_version"
        case huaweiVersion = "huawei_version"
    }
}

// MARK: - AdsBanner
struct AdsBanner: Codable {
    var img: String?
    var mediaType: String?
    var duration: Int?

    enum CodingKeys: String, CodingKey {
        case img
        case mediaType = "media_type"
        case duration
    }
}

// MARK: - Category
struct Category: Codable {
    var id: Int?
    var name: String?
    var categoryDescription: String?
    var image: String?
    var slug: String?
    var children: [Category]?
    var circleIcon: String?
    var disableShipping: Int?

    enum CodingKeys: String, CodingKey {
        case id, name
        case categoryDescription = "description"
        case image, slug, children
        case circleIcon = "circle_icon"
        case disableShipping = "disable_shipping"
    }
}

// MARK: - Statistics
struct Statistics: Codable {
    var auctions, users, products: Int?
}



//MARK: - Subcategory
struct ProcessTypeModel: Codable {
    var code: Int?
    var msg: String?
    var data: [ProcessTypeDataModel]?
}

// MARK: - Datum
struct ProcessTypeDataModel: Codable {
    var id: Int?
    var name: String?
    var type: String?
    var value: String?
    var options: [OptionModel]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case type, value
        case options
    }
}

// MARK: - Option
struct OptionModel: Codable {
    var id: Int?
    var name, slug: String?
    var parent: Int?
    var child: Bool?
}
