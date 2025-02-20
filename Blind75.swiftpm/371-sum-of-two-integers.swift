//Given two integers a and b, return the sum of the two integers without using the operators + and -.
//
//
//
//Example 1:
//
//Input: a = 1, b = 2
//Output: 3
//Example 2:
//
//Input: a = 2, b = 3
//Output: 5
//
//
//Constraints:
//
//-1000 <= a, b <= 1000

// O(1) O(1)

extension Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        var result = a, carry = b
        while carry != 0 {
            // Xoring(^) is equivalent to sum without carry
            let tempSum = result ^ carry
            // Logical AND(&) is equivalent to carry
            // Must be shifted left by 1 because it affects the next higher bit position in addition
            let tempShiftedCarry = (result & carry) << 1
            result = tempSum
            carry = tempShiftedCarry
        }
        return result
    }

    func testGetSum() {
        let num1 = 999
        let num2 = 991
        let result = getSum(num1, num2)
        print(result)

        let expectedResult = 1990
        assert(result == expectedResult)
    }
}
