// NL 2021

import Foundation

extension TokenMetadata {
    public struct TokenMeta: Codable {
        public let name: String
        public let symbol: String
        /// URI to retrieve the JSON metadata extension
        public let uri: URL
        public let updateAuthority: String
        public let primarySaleHappened: Bool
        /// Royalties percentage awarded to creators, shown as percentage, if present.
        public let sellerFeeBasisPoints: Double?
    }
}
