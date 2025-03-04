//Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.
//
//
//
//Example 1:
//
//Input: nums = [3,0,1]
//
//Output: 2
//
//Explanation:
//
//n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.
//
//Example 2:
//
//Input: nums = [0,1]
//
//Output: 2
//
//Explanation:
//
//n = 2 since there are 2 numbers, so all numbers are in the range [0,2]. 2 is the missing number in the range since it does not appear in nums.
//
//Example 3:
//
//Input: nums = [9,6,4,2,3,5,7,0,1]
//
//Output: 8
//
//Explanation:
//
//n = 9 since there are 9 numbers, so all numbers are in the range [0,9]. 8 is the missing number in the range since it does not appear in nums.
//
//
//
//Constraints:
//
//n == nums.length
//1 <= n <= 104
//0 <= nums[i] <= n
//All the numbers of nums are unique.
//
//
//Follow up: Could you implement a solution using only O(1) extra space complexity and O(n) runtime complexity?


// O(n) O(1)

extension Solution {
    func missingNumber1(_ nums: [Int]) -> Int {
        // Calculate the sum from 0 to n. Then substract current sum

        // Sum(0..n) calculated in O(n):
        //(0...nums.count).reduce(0,+) - nums.reduce(0,+)

        // Sum(0..n) calculated in O(1):
        nums.count * (nums.count + 1) / 2 - nums.reduce(0,+)
    }

    func missingNumber2(_ nums: [Int]) -> Int {
        // Calculate the xor from 0 to n. Then xor of current nums.
        // When xoring the same numbers, both are removed from result
        (0...nums.count).reduce(0, ^) ^ (nums.reduce(0, ^))
    }

    func testMissingNumber1() {
        let nums = [3,0,1]
        let result = missingNumber1(nums)
        print(result)

        let expectedResult = 2
        assert(result == expectedResult)
    }

    func testMissingNumber2() {
        let nums = [0,1]
        let result = missingNumber2(nums)
        print(result)

        let expectedResult = 2
        assert(result == expectedResult)
    }
}
