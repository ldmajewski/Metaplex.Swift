# Metaplex.Swift

Support for Metaplex data structures and instructions with Solana.Swift

## Using Metaplex.Swift

This package gives you the raw materials — including replicas of on-chain models, off-chain models, instructions, and helper methods — to build almost any interaction with the Metaplex programs, but the highest-level abstractions available out of the box focus on reading data. See "A Note About Multi-Step Processes" for more information on this.

To use the basic interface, add this project as a dependency in SPM, then use `ActionTemplate` alongside any adapters you prefer to handle calls to the network:

For example, using the [Swift Structured Concurrency adapter](https://github.com/NathanLawrence/Solana.AsyncSwift):

```swift
import Foundation
import Solana
import AsyncSolana
import Metaplex

public class MetaplexDemoViewModel {
    func getEdition() async throws -> PublicKey {
        // configure the "Action" class exactly as you would normally
        let action = Action(...) 
        
        // Build a request with the MetaplexActions child struct representing what you want to do.
        let request = MetaplexActions.GetEdition(...) 
        
        // Ask the Action class to asynchronously fetch your request's results.
        return try await action.perform(request)
    }
}
```

Or using callbacks, without any adapter at all:

```swift
import Foundation
import Solana
import Metaplex

public class MetaplexDemoViewModel {
    func getEdition(callback: (Result<PublicKey, Error>) -> Void) {
        // configure the "Action" class exactly as you would normally
        let action = Action(...) 
        
        // Build a request with the MetaplexActions child struct representing what you want to do.
        let request = MetaplexActions.GetEdition(...) 
        
        // Ask the Action class to asynchronously fetch your request's results.
        return try await action.perform(request, completion: callback)
    }
}
```

## A Note About Multi-Step Processes

As things stand now, some operations in Metaplex initiate multiple discrete transactions after receiving results from the previous one. 

These should not be performed directly from a mobile device if such a thing can be avoided; issues like dropped connections, memory jetsams, and the user making your app inactive do not create vulnerabilities from a security perspective, but they have the potential to create costly or frustrating failed operations — meaning that it is likely you'll need to delegate some of this work to a server.
