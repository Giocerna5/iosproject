// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let account = try? newJSONDecoder().decode(Account.self, from: jsonData)

import Foundation

// MARK: - Account
class Account: Codable {
    var data: Datum?
    var reload: Bool? = false
    
    init(data: Datum?, reload: Bool?) {
        self.data = data
        self.reload = reload
    }
    
    func ReloadObj() -> Void {
        self.reload = !(self.reload ?? true)
    }
}

// MARK: - Datum
class Datum: Codable {
    var platformInfo: PlatformInfo?
    var userInfo: UserInfo?
    var metadata: DatumMetadata?
    var segments: [Segment]?
    var availableSegments: [AvailableSegment]?
    var expiryDate: String?

    init(platformInfo: PlatformInfo?, userInfo: UserInfo?, metadata: DatumMetadata?, segments: [Segment]?, availableSegments: [AvailableSegment]?, expiryDate: String?) {
        self.platformInfo = platformInfo
        self.userInfo = userInfo
        self.metadata = metadata
        self.segments = segments
        self.availableSegments = availableSegments
        self.expiryDate = expiryDate
    }
}

// MARK: - AvailableSegment
class AvailableSegment: Codable {
    var type: TypeEnum?
    var attributes: MetadataClass?

    init(type: TypeEnum?, attributes: MetadataClass?) {
        self.type = type
        self.attributes = attributes
    }
}

// MARK: - MetadataClass
class MetadataClass: Codable {

    init() {
    }
}

enum TypeEnum: String, Codable {
    case legend = "legend"
    case overview = "overview"
}

// MARK: - DatumMetadata
class DatumMetadata: Codable {
    var currentSeason: Int?
    var activeLegend, activeLegendName: String?

    init(currentSeason: Int?, activeLegend: String?, activeLegendName: String?) {
        self.currentSeason = currentSeason
        self.activeLegend = activeLegend
        self.activeLegendName = activeLegendName
    }
}

// MARK: - PlatformInfo
class PlatformInfo: Codable {
    var platformSlug, platformUserID, platformUserHandle, platformUserIdentifier: String?
    var avatarURL: String?
    var additionalParameters: JSONNull?

    enum CodingKeys: String, CodingKey {
        case platformSlug
        case platformUserID = "platformUserId"
        case platformUserHandle, platformUserIdentifier
        case avatarURL = "avatarUrl"
        case additionalParameters
    }

    init(platformSlug: String?, platformUserID: String?, platformUserHandle: String?, platformUserIdentifier: String?, avatarURL: String?, additionalParameters: JSONNull?) {
        self.platformSlug = platformSlug
        self.platformUserID = platformUserID
        self.platformUserHandle = platformUserHandle
        self.platformUserIdentifier = platformUserIdentifier
        self.avatarURL = avatarURL
        self.additionalParameters = additionalParameters
    }
}

// MARK: - Segment
class Segment: Codable {
    var type: TypeEnum?
    var attributes: SegmentAttributes?
    var metadata: SegmentMetadata?
    var expiryDate: String?
    var stats: Stats?

    init(type: TypeEnum?, attributes: SegmentAttributes?, metadata: SegmentMetadata?, expiryDate: String?, stats: Stats?) {
        self.type = type
        self.attributes = attributes
        self.metadata = metadata
        self.expiryDate = expiryDate
        self.stats = stats
    }
}

// MARK: - SegmentAttributes
class SegmentAttributes: Codable {
    var id: String?

    init(id: String?) {
        self.id = id
    }
}

// MARK: - SegmentMetadata
class SegmentMetadata: Codable {
    var name: String?
    var imageURL, tallImageURL: String?
    var bgImageURL: String?
    var isActive: Bool?

    enum CodingKeys: String, CodingKey {
        case name
        case imageURL = "imageUrl"
        case tallImageURL = "tallImageUrl"
        case bgImageURL = "bgImageUrl"
        case isActive
    }

    init(name: String?, imageURL: String?, tallImageURL: String?, bgImageURL: String?, isActive: Bool?) {
        self.name = name
        self.imageURL = imageURL
        self.tallImageURL = tallImageURL
        self.bgImageURL = bgImageURL
        self.isActive = isActive
    }
}

// MARK: - Stats
class Stats: Codable {
    var level, kills, finishers, carePackageKills: BombardmentKills?
    var season2WINS: BombardmentKills?
    var rankScore: RankScore?
    var bombardmentKills, seasonWINS, season3WINS, damage: BombardmentKills?
    var headshots, eyeEnemiesScanned, winningKills: BombardmentKills?
    var mapping : [String:String]?

    enum CodingKeys: String, CodingKey {
        case level, kills, finishers, carePackageKills
        case season2WINS = "season2Wins"
        case rankScore, bombardmentKills
        case seasonWINS = "seasonWins"
        case season3WINS = "season3Wins"
        case damage, headshots, eyeEnemiesScanned, winningKills
    }

    init(level: BombardmentKills?, kills: BombardmentKills?, finishers: BombardmentKills?, carePackageKills: BombardmentKills?, season2WINS: BombardmentKills?, rankScore: RankScore?, bombardmentKills: BombardmentKills?, seasonWINS: BombardmentKills?, season3WINS: BombardmentKills?, damage: BombardmentKills?, headshots: BombardmentKills?, eyeEnemiesScanned: BombardmentKills?, winningKills: BombardmentKills?) {
        self.level = level
        self.kills = kills
        self.finishers = finishers
        self.carePackageKills = carePackageKills
        self.season2WINS = season2WINS
        self.rankScore = rankScore
        self.bombardmentKills = bombardmentKills
        self.seasonWINS = seasonWINS
        self.season3WINS = season3WINS
        self.damage = damage
        self.headshots = headshots
        self.eyeEnemiesScanned = eyeEnemiesScanned
        self.winningKills = winningKills

    }
}

// MARK: - BombardmentKills
class BombardmentKills: Codable {
    var rank: Int?
    var percentile: Double?
    var displayName: String?
    var displayCategory: DisplayCategory?
    var category: JSONNull?
    var metadata: MetadataClass?
    var value: Int?
    var displayValue: String?
    var displayType: DisplayType?

    init(rank: Int?, percentile: Double?, displayName: String?, displayCategory: DisplayCategory?, category: JSONNull?, metadata: MetadataClass?, value: Int?, displayValue: String?, displayType: DisplayType?) {
        self.rank = rank
        self.percentile = percentile
        self.displayName = displayName
        self.displayCategory = displayCategory
        self.category = category
        self.metadata = metadata
        self.value = value
        self.displayValue = displayValue
        self.displayType = displayType
    }
}

enum DisplayCategory: String, Codable {
    case combat = "Combat"
    case game = "Game"
    case weapons = "Weapons"
}

enum DisplayType: String, Codable {
    case unspecified = "Unspecified"
}

// MARK: - RankScore
class RankScore: Codable {
    var rank: Int?
    var percentile: Double?
    var displayName: String?
    var displayCategory: DisplayCategory?
    var category: JSONNull?
    var metadata: RankScoreMetadata?
    var value: Int?
    var displayValue: String?
    var displayType: DisplayType?

    init(rank: Int?, percentile: Double?, displayName: String?, displayCategory: DisplayCategory?, category: JSONNull?, metadata: RankScoreMetadata?, value: Int?, displayValue: String?, displayType: DisplayType?) {
        self.rank = rank
        self.percentile = percentile
        self.displayName = displayName
        self.displayCategory = displayCategory
        self.category = category
        self.metadata = metadata
        self.value = value
        self.displayValue = displayValue
        self.displayType = displayType
    }
}

// MARK: - RankScoreMetadata
class RankScoreMetadata: Codable {
    var iconURL: String?

    enum CodingKeys: String, CodingKey {
        case iconURL = "iconUrl"
    }

    init(iconURL: String?) {
        self.iconURL = iconURL
    }
}

// MARK: - UserInfo
class UserInfo: Codable {
    var isPremium, isVerified, isInfluencer: Bool?
    var countryCode: String?
    var customAvatarURL: JSONNull?
    var socialAccounts: [JSONAny]?

    enum CodingKeys: String, CodingKey {
        case isPremium, isVerified, isInfluencer, countryCode
        case customAvatarURL = "customAvatarUrl"
        case socialAccounts
    }

    init(isPremium: Bool?, isVerified: Bool?, isInfluencer: Bool?, countryCode: String?, customAvatarURL: JSONNull?, socialAccounts: [JSONAny]?) {
        self.isPremium = isPremium
        self.isVerified = isVerified
        self.isInfluencer = isInfluencer
        self.countryCode = countryCode
        self.customAvatarURL = customAvatarURL
        self.socialAccounts = socialAccounts
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
