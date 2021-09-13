// NL 2021

import Foundation
import Solana

extension Metaplex {
    public struct Edition: BorshCodable {
        public init(key: String, parent: PublicKey, edition: UInt64) {
            self.key = key
            self.parent = parent
            self.edition = edition
        }

        public let key: String

        /// Master edition public key
        public let parent: PublicKey
        
        /// Edition number, 0 for public record, incremented for each
        public let edition: UInt64

        public init(from reader: inout BinaryReader) throws {
            self.key = try .init(from: &reader)
            self.parent = try .init(from: &reader)
            self.edition = try .init(from: &reader)
        }

        public func serialize(to writer: inout Data) throws {
            try key.serialize(to: &writer)
            try parent.serialize(to: &writer)
            try edition.serialize(to: &writer)
        }
    }
}
