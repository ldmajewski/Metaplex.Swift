// NL 2021

import Foundation
import Solana

extension Metaplex {
    public struct Metadata: BorshCodable {

        public init(key: String, updateAuthority: String, mint: String, data: Metaplex.PlexData, primarySaleHappened: Bool, isMutable: Bool, editionNonce: UInt64? = nil) {
            self.key = key
            self.updateAuthority = updateAuthority
            self.mint = mint
            self.data = data
            self.primarySaleHappened = primarySaleHappened
            self.isMutable = isMutable
            self.editionNonce = editionNonce
        }

        public let key: String
        public let updateAuthority: String
        public let mint: String
        public let data: PlexData
        public let primarySaleHappened: Bool
        public let isMutable: Bool
        public let editionNonce: UInt64?

        public init(from reader: inout BinaryReader) throws {
            self.key = try .init(from: &reader)
            self.updateAuthority = try .init(from: &reader)
            self.mint = try .init(from: &reader)
            self.data = try .init(from: &reader)
            self.primarySaleHappened = try .init(from: &reader)
            self.isMutable = try .init(from: &reader)
            self.editionNonce = try? .init(from: &reader)
        }

        public func serialize(to writer: inout Data) throws {
            try key.serialize(to: &writer)
            try updateAuthority.serialize(to: &writer)
            try mint.serialize(to: &writer)
            try data.serialize(to: &writer)
            try primarySaleHappened.serialize(to: &writer)
            try isMutable.serialize(to: &writer)
            try editionNonce?.serialize(to: &writer)
        }
    }
}
