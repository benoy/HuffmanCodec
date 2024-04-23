//
//  MinPriorityQueueTests.swift
//  HuffmanCodecTests
//
//  Created by Binoy Vijayan on 23/04/24.
//

import XCTest
@testable import HuffmanCodec

struct TestElement: Prioritizable {
    let frequency: Int
}

// Make TestElement comparable for testing purposes

extension TestElement: Comparable {
    static func < (lhs: TestElement, rhs: TestElement) -> Bool {
        return lhs.frequency < rhs.frequency
    }
}

final class MinPriorityQueueTests: XCTestCase {

    func testEnqueueAndDequeue() {
        
        let minQueue = MinPriorityQueue<TestElement>()
        
        // Enqueue elements
        minQueue.enqueue(TestElement(frequency: 3))
        minQueue.enqueue(TestElement(frequency: 1))
        minQueue.enqueue(TestElement(frequency: 5))
        minQueue.enqueue(TestElement(frequency: 2))
        
        // Dequeue elements
        XCTAssertEqual(minQueue.dequeue()?.frequency, 1)
        XCTAssertEqual(minQueue.dequeue()?.frequency, 2)
        XCTAssertEqual(minQueue.dequeue()?.frequency, 3)
        XCTAssertEqual(minQueue.dequeue()?.frequency, 5)
        XCTAssertNil(minQueue.dequeue())
    }
    
    // Test isEmpty property
    
    func testIsEmpty() {
        let minQueue = MinPriorityQueue<TestElement>()
        XCTAssertTrue(minQueue.isEmpty)
        
        minQueue.enqueue(TestElement(frequency: 1))
        XCTAssertFalse(minQueue.isEmpty)
        
        _ = minQueue.dequeue()
        XCTAssertTrue(minQueue.isEmpty)
    }
    
    // Test count property
    
    func testCount() {
        let minQueue = MinPriorityQueue<TestElement>()
        XCTAssertEqual(minQueue.count, 0)
        
        minQueue.enqueue(TestElement(frequency: 1))
        XCTAssertEqual(minQueue.count, 1)
        
        minQueue.enqueue(TestElement(frequency: 2))
        XCTAssertEqual(minQueue.count, 2)
        
        _ = minQueue.dequeue()
        XCTAssertEqual(minQueue.count, 1)
        
        _ = minQueue.dequeue()
        XCTAssertEqual(minQueue.count, 0)
    }

}
