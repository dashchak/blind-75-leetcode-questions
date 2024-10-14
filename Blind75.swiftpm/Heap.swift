//
//  Heap.swift
//  Blind75
//
//  Created by Roman Dashchakivskyi on 10/13/24.
//

import Foundation


struct Heap<T> {
    var nodes = [T]()
    let compareFunc: (T,T) -> Bool

    init(_ compareFunc: @escaping (T,T) -> Bool ) {
        self.compareFunc = compareFunc
    }

    var size: Int {
        return nodes.count
    }

    mutating func insert(contentsOf: [T]) {
        contentsOf.forEach { insert($0) }
    }

    mutating func insert(_ elem: T) {
        nodes.append(elem)
        bubbleUp(size-1)
    }

    @discardableResult
    mutating func extract() -> T? {
        if size == 0 { return nil }
        if size == 1 { return nodes.removeLast() }

        nodes.swapAt(0, size-1)
        let res = nodes.removeLast()
        bubbleDown(0)
        return res
    }

    private mutating func bubbleUp(_ index: Int) {
        let parentIndex = parentIndex(index)
        if parentIndex == -1 { return }

        if compareFunc(nodes[index], nodes[parentIndex]) {
            nodes.swapAt(parentIndex, index)
            bubbleUp(parentIndex)
        }
    }

    private mutating func bubbleDown(_ index: Int) {
        let childIndex = childIndexToSwap(index)
        if childIndex == -1 { return }

        if compareFunc(nodes[childIndex], nodes[index]) {
            nodes.swapAt(childIndex, index)
            bubbleDown(childIndex)
        }
    }

    private func childIndexToSwap(_ index: Int) -> Int {
        let l = leftChildIndex(index)
        if l >= size { return -1 }

        let r = rightChildIndex(index)
        if r >= size { return l }

        return compareFunc(nodes[l], nodes[r]) ? l : r
    }

    private func parentIndex(_ index: Int) -> Int {
        return (index - 1) / 2
    }

    private func leftChildIndex(_ index: Int) -> Int {
        return 2 * index + 1
    }

    private func rightChildIndex(_ index: Int) -> Int {
        return 2 * index + 2
    }
}
