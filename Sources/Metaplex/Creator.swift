// NL 2021

import Foundation
import Solana

extension Metaplex {
    public struct Creator: BorshCodable {
        public init(address: String, verified: Bool, share: UInt8) {
            self.address = address
            self.verified = verified
            self.share = share
        }


        public let address: String
        public let verified: Bool

        /// Percentages, NOT base points, careful
        public let share: UInt8

        public init(from reader: inout BinaryReader) throws {
            self.address = try .init(from: &reader)
            self.verified = try .init(from: &reader)
            self.share = try .init(from: &reader)
        }

        public func serialize(to writer: inout Data) throws {
            try address.serialize(to: &writer)
            try verified.serialize(to: &writer)
            try share.serialize(to: &writer)
        }

    }
}
