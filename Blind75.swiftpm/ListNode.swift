//
//  ListNode.swift
//  Blind75
//
//  Created by Roman Dashchakivskyi on 10/4/24.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

extension ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        lhs.val == rhs.val
    }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        var result = ""
        var cur: ListNode? = self
        while let unwrappedCur = cur {
            result += String(unwrappedCur.val) + " -> "
            cur = unwrappedCur.next
        }
        result.append("nil")
        return result
    }
}
