//
//  207-course-schedule.swift
//  Blind75
//
//  Created by Roman Dashchakivskyi on 10/28/24.
//

//There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.
//
//For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
//Return true if you can finish all courses. Otherwise, return false.
//
//
//
//Example 1:
//
//Input: numCourses = 2, prerequisites = [[1,0]]
//Output: true
//Explanation: There are a total of 2 courses to take.
//To take course 1 you should have finished course 0. So it is possible.
//Example 2:
//
//Input: numCourses = 2, prerequisites = [[1,0],[0,1]]
//Output: false
//Explanation: There are a total of 2 courses to take.
//To take course 1 you should have finished course 0, and to take course 0 you should also have finished course 1. So it is impossible.
//
//
//Constraints:
//
//1 <= numCourses <= 2000
//0 <= prerequisites.length <= 5000
//prerequisites[i].length == 2
//0 <= ai, bi < numCourses
//All the pairs prerequisites[i] are unique.
//

import Foundation

// O(V+E) O(V+E)
// Topological sort (Kahn's algorithm)
extension Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var indegree = [Int: Int]() // node: indegree
        var adjList = [Int: [Int]]() //val: neighbs

        //Create adjList and indegrees. O(E), where E is the number of edges
        for prereq in prerequisites {
            let (child, main) = (prereq[0], prereq[1])
            adjList[main, default: []].append(child)
            indegree[child, default: 0] += 1
            // IMPORTANT: since we use dict, we must keep track of 0.
            // It is possible to use counting array as we now nodes are from [0,n-1]
            indegree[main, default: 0] += 0
        }

        // Start with 0 indegree nodes
        var queue = indegree.filter { $0.value == 0 }.map { $0.key }

        // Each node is added and removed from the queue once,
        // making this O(V+E), where V is the numCourses, and E is the number of edges.
        while !queue.isEmpty {
            var tempQueue = [Int]()
            for parent in queue {
                for child in adjList[parent, default: []] {
                    indegree[child, default: 0] -= 1
                    // IMPORTANT: add to queue only 0 indegress
                    if indegree[child, default: 0] == 0 {
                        tempQueue.append(child)
                    }
                }
            }

            queue = tempQueue
        }
        return indegree.filter { $0.1 > 0 }.count == 0
    }

    func testCanFinish() {
        let prerequisites = [[1,0],[0,1]]
        let numCourses = 2
        let result = canFinish(numCourses, prerequisites)
        print(result)

        let expectedResult = false
        assert(result == expectedResult)
    }
}
