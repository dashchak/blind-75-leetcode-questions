import SwiftUI

class Solution {}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            EmptyView()
        }
    }


    init() {
        let solution = Solution()
        solution.testLongestConsecutive()
        
    }
}


