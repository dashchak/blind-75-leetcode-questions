//You have a graph of n nodes labeled from 0 to n - 1. You are given an integer n and a list of edges where edges[i] = [ai, bi] indicates that there is an undirected edge between nodes ai and bi in the graph.
//
//Return true if the edges of the given graph make up a valid tree, and false otherwise.
//
//
//
//Example 1:
//
//
//Input: n = 5, edges = [[0,1],[0,2],[0,3],[1,4]]
//Output: true
//Example 2:
//
//
//Input: n = 5, edges = [[0,1],[1,2],[2,3],[1,3],[1,4]]
//Output: false
//
//
//Constraints:
//
//1 <= n <= 2000
//0 <= edges.length <= 5000
//edges[i].length == 2
//0 <= ai, bi < n
//ai != bi
//There are no self-loops or repeated edges.

import Foundation



// O(N) O(N)
// DFS iterative
extension Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        // Graph with less than n-1 edges is not connected
        // Graph with more than n-1 edges has cycle
        guard edges.count == n - 1 else { return false }

        // Create adjancency list
        var adjList = [Int: [Int]]() // node: neighbors
        for edge in edges {
            let (start, end) = (edge[0], edge[1])
            adjList[start, default: []].append(end)
            adjList[end, default: []].append(start)
        }

        // Start DFS from node 0
        var stack = [0]
        var visited: Set<Int> = [0]
        while !stack.isEmpty {
            let last = stack.removeLast()
            for neighbor in adjList[last, default: []] where !visited.contains(neighbor) {
                stack.append(neighbor)
                visited.insert(neighbor)
            }
        }
        return visited.count == n
    }

    func testValidTree() {
        let edges = [[0,1],[0,2],[0,3],[1,4]]
        let n = 5
        let result = validTree(n, edges)
        print(result)

        let expectedResult = true
        assert(result == expectedResult)
    }
}
