//Given a positive integer n, write a function that returns the number of
//set bits
// in its binary representation (also known as the Hamming weight).
//
//
//
//Example 1:
//
//Input: n = 11
//
//Output: 3
//
//Explanation:
//
//The input binary string 1011 has a total of three set bits.
//
//Example 2:
//
//Input: n = 128
//
//Output: 1
//
//Explanation:
//
//The input binary string 10000000 has a total of one set bit.
//
//Example 3:
//
//Input: n = 2147483645
//
//Output: 30
//
//Explanation:
//
//The input binary string 1111111111111111111111111111101 has a total of thirty set bits.
//
//
//
//Constraints:
//
//1 <= n <= 2^31 - 1
//
//
//Follow up: If this function is called many times, how would you optimize it?

// O(1) O(1)

extension Solution {
    // Does not work with negatives.
    // Because when a negative Int is right-shifted (>>),
    // the most significant bit (MSB which is 1) is preserved in higher bits
    func hammingWeight1(_ n: Int) -> Int {
        var result = 0
        // Make n mutable so it can be shifted
        var n = n
        while n != 0 {
            result += n & 1
            n >>= 1
        }
        return result
    }

    // Also does not work with negatives as can overflow in n-1 and crash
    func hammingWeight2(_ n: Int) -> Int {
        var result = 0
        // Make n mutable so it can be shifted
        var n = n
        while n != 0 {
            result += 1
            n &= (n - 1) // Clears the lowest set bit
        }
        return result
    }
    // Clear the lowest set bit
    // 10100  20
    // 10011  19
    // 10000  20&19 = 16
    // 01111 15
    // 00000 16&15 = 0

    // Another solution could be to have a mask and shift it left.
    // But handling shifting overflow can be problem.

    func testHammingWeight1() {
        let num = 2147483645
        let result = hammingWeight1(num)
        print(result)

        let expectedResult = 30
        assert(result == expectedResult)
    }

    func testHammingWeight2() {
        let num = 11
        let result = hammingWeight2(num)
        print(result)

        let expectedResult = 3
        assert(result == expectedResult)
    }
}
