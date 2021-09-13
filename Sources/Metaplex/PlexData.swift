// NL 2021

import Foundation
import Solana

extension Metaplex {
    public struct PlexData: BorshCodable {
        public init(name: String, symbol: String, uri: String, sellerFeeBasisPoints: UInt16, creators: [Metaplex.Creator]) {
            self.name = name
            self.symbol = symbol
            self.uri = uri
            self.sellerFeeBasisPoints = sellerFeeBasisPoints
            self.creators = creators
        }

        public let name: String
        public let symbol: String
        public let uri: String
        public let sellerFeeBasisPoints: UInt16
        public let creators: [Creator]

        public init(from reader: inout BinaryReader) throws {
            self.name = try .init(from: &reader)
            self.symbol = try .init(from: &reader)
            self.uri = try .init(from: &reader)
            self.sellerFeeBasisPoints = try .init(from: &reader)
            self.creators = try .init(from: &reader)
        }

        public func serialize(to writer: inout Data) throws {
            try name.serialize(to: &writer)
            try symbol.serialize(to: &writer)
            try uri.serialize(to: &writer)
            try sellerFeeBasisPoints.serialize(to: &writer)
            try creators.serialize(to: &writer)
        }


    }
}
