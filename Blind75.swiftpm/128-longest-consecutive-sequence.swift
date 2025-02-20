//Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.
//
//You must write an algorithm that runs in O(n) time.
//
//
//
//Example 1:
//
//Input: nums = [100,4,200,1,3,2]
//Output: 4
//Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
//Example 2:
//
//Input: nums = [0,3,7,2,5,8,4,6,0,1]
//Output: 9
//
//
//Constraints:
//
//0 <= nums.length <= 105
//-109 <= nums[i] <= 109


//O(n) O(n)

extension Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let numSet = Set(nums) // Use a Set to allow O(1) lookups
        var longestStreak = 0

        for num in numSet {
            // Only start counting if it's the beginning of a sequence
            if !numSet.contains(num - 1) {
                var next = num + 1
                var currentStreak = 1

                // Count up while the next consecutive number exists
                while numSet.contains(next) {
                    currentStreak += 1
                    next += 1
                }

                // Update the longest streak found
                longestStreak = max(longestStreak, currentStreak)
            }
        }

        return longestStreak
    }


    func testLongestConsecutive() {
        let nums = [0,3,7,2,5,8,4,6,0,1]
        let result = longestConsecutive(nums)
        print(result)

        let expectedResult = 9
        assert(result == expectedResult)
    }
}
