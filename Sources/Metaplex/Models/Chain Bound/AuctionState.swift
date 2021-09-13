// NL 2021

import Foundation

extension Metaplex {
    public enum AuctionState: Int, RawRepresentable {
        case created = 0
        case started = 2
        case ended = 3
    }

    public enum BidStateType: Int, RawRepresentable {
        case EnglishAuction = 0
        case OpenEdition = 1
    }
}
