//
//  HuffmanTree.swift
//  HuffmanCodec
//
//  Created by Binoy Vijayan on 12/01/24.
//

import Foundation

class HuffmanNode: Prioritizable {
    
    var character: Character?
    var frequency: Int
    var left: HuffmanNode?
    var right: HuffmanNode?
    
    init(_ character: Character?, _ frequency: Int) {
        self.character = character
        self.frequency = frequency
    }
    
    static func == (lhs: HuffmanNode, rhs: HuffmanNode) -> Bool { return lhs.frequency == rhs.frequency }
    
    static func < (lhs: HuffmanNode, rhs: HuffmanNode) -> Bool { return lhs.frequency < rhs.frequency }

    static func > (lhs: HuffmanNode, rhs: HuffmanNode) -> Bool { return lhs.frequency > rhs.frequency }
}

class HuffmanTree {
    
    func buildTree(_ frequencies: [Character: Int]) -> HuffmanNode? {
        
        let priorityQueue = MinPriorityQueue<HuffmanNode>()
        
        /* Creating individul node and enqueueing the same to the priority queue */
        for (character, frequency) in frequencies {
            let node = HuffmanNode(character, frequency)
            priorityQueue.enqueue(node)
        }
        
        /* Creating a Huffman tree involves connecting individual nodes.*/
        while priorityQueue.count > 1 {
            
            let left = priorityQueue.dequeue()
            let right = priorityQueue.dequeue()
            let parentFrequency = (left?.frequency ?? 0) + (right?.frequency ?? 0)
            let parent = HuffmanNode(nil, parentFrequency)
            parent.left = left
            parent.right = right
            priorityQueue.enqueue(parent)
        }
        
        /*  FFinally, the priority queue will have only one node, which is the root node */
        return priorityQueue.dequeue()
        
    }

    func generateHuffmanCodes(_ node: HuffmanNode, _ code: String, _ codes: inout [Character: String]) {
        
        if let character = node.character { codes[character] = code }
        else {
            if let left = node.left { generateHuffmanCodes(left, code + "0",  &codes) }
            if let right = node.right { generateHuffmanCodes(right, code + "1", &codes) }
        }
    }


    func serializeTree(_ root: HuffmanNode) -> String {
        
        var serialized = ""
        
        func traverse(_ node: HuffmanNode) {
            
            if let char = node.character { serialized += "#:\(char)" }
            else {
                serialized += "~"
                traverse(node.left!)
                traverse(node.right!)
            }
        }
        traverse(root)
        
        return serialized
    }

    func deserializeTree(_ serialized: String) -> HuffmanNode? {
        var index = serialized.startIndex

        func deserialize() -> HuffmanNode? {
            guard index < serialized.endIndex else { return nil }
            
            let currentChar = serialized[index]
            index = serialized.index(after: index)
            
            if currentChar == "#" {
                let charIndex = serialized.index(after: index)
                let char = serialized[charIndex]
                index = serialized.index(after: charIndex)
                return HuffmanNode(char, 0)
            } else if currentChar == "~" {
                let leftChild = deserialize()
                let rightChild = deserialize()
                let parentNode = HuffmanNode( nil, 0)
                parentNode.left = leftChild
                parentNode.right = rightChild
                return parentNode
            } else {
                fatalError("Invalid serialization format")
            }
        }
        
        return deserialize()
    }
}


