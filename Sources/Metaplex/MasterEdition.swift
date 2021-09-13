import Foundation
import Solana

extension Metaplex {
    public struct MasterEdition: BorshSerializable {
        public init(key: PublicKey, supply: UInt64, maxSupply: UInt64?) {
            self.key = key
            self.supply = supply
            self.maxSupply = maxSupply
        }

        public let key: PublicKey
        public let supply: UInt64
        public let maxSupply: UInt64?

        public init(from reader: inout BinaryReader) throws {
            try self.key = .init(from: &reader)
            try self.supply = .init(from: &reader)
            self.maxSupply = try? .init(from: &reader)
        }

        public func serialize(to writer: inout Data) throws {
            try key.serialize(to: &writer)
            try supply.serialize(to: &writer)
            try maxSupply?.serialize(to: &writer)
        }

    }
}
