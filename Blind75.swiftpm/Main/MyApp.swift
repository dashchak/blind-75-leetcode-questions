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
        solution.testMergeTwoLists()
        solution.testTopKFrequent()
        solution.testCanFinish()
        solution.testValidTree()
        solution.testTrie()
        solution.testSearch()
    }
}



