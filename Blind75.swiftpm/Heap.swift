//
//  Heap.swift
//  Blind75
//
//  Created by Roman Dashchakivskyi on 10/13/24.
//

import Foundation


struct Heap<T> {
    private var arr = [T]()
    private let compareFunc: (T,T) -> Bool

    init(_ compareFunc: @escaping (T,T) -> Bool ) {
        self.compareFunc = compareFunc
    }

    var size: Int {
        return arr.count
    }

    mutating func insert(contentsOf: [T]) {
        contentsOf.forEach { insert($0) }
    }

    mutating func insert(_ elem: T) {
        arr.append(elem)
        bubbleUp(size-1)
    }

    @discardableResult
    mutating func extract() -> T? {
        if size == 0 { return nil }
        if size == 1 { return arr.removeLast() }

        arr.swapAt(0, size-1)
        let res = arr.removeLast()
        bubbleDown(0)
        return res
    }
    
    func peek() -> T? {
        return arr.first
    }

    private mutating func bubbleUp(_ index: Int) {
        let parentIndex = parentIndex(index)
        if parentIndex == -1 { return }

        if compareFunc(arr[index], arr[parentIndex]) {
            arr.swapAt(parentIndex, index)
            bubbleUp(parentIndex)
        }
    }

    private mutating func bubbleDown(_ index: Int) {
        let childIndex = childIndexToSwap(index)
        if childIndex == -1 { return }

        if compareFunc(arr[childIndex], arr[index]) {
            arr.swapAt(childIndex, index)
            bubbleDown(childIndex)
        }
    }

    private func childIndexToSwap(_ index: Int) -> Int {
        let l = leftChildIndex(index)
        if l >= size { return -1 }

        let r = rightChildIndex(index)
        if r >= size { return l }

        return compareFunc(arr[l], arr[r]) ? l : r
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
