//
//  ListNodeFactory.swift
//  Blind75
//
//  Created by Roman Dashchakivskyi on 10/4/24.
//

import Foundation

public class ListNodeFactory {
    // Factory method to create a list from an array
    public static func createList(_ array: [Int]) -> ListNode? {
        guard !array.isEmpty else { return nil }

        // Initialize head and current node
        let head = ListNode(array[0])
        var current = head

        // Iterate over the array starting from the second element
        for i in 1..<array.count {
            current.next = ListNode(array[i])
            current = current.next!
        }

        return head
    }
}

