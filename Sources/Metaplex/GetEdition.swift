// NL 2021

import Foundation
import Solana
import CryptoKit

extension MetaplexActions {
    public struct GetEdition: ActionTemplate {
        public typealias Success = PublicKey
        public let tokenMint: PublicKey
        
        public init(tokenMint: PublicKey) {
            self.tokenMint = tokenMint
        }

        public func perform(withConfigurationFrom actionClass: Action, completion: @escaping (Result<Success, Error>) -> Void) {

            let seed = [String.metadataPrefix.bytes +
                        PublicKey.metadataProgramId.bytes +
                        tokenMint.bytes +
                        String.editionKeyword.bytes].map { Data($0) }

            let key = PublicKey._findProgramAddress(seeds: seed, programId: .metadataProgramId)

            guard let key = key else {
                completion(.failure(MetaplexError.publicKeyError(nil)))
                return
            }

            completion(.success(key.0))
        }
    }
}
