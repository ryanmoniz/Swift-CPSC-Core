//
//  main.swift
//  Sorting
//
//  Created by Ryan Moniz on 2015-07-18.
//  Copyright © 2015 ryanmoniz. All rights reserved.
//
// Basic Sorting algorithm in Swift 2.0

import Foundation

//a simple set of integers to sort

var numberList : [Int] = [8,2,4,6,11,13,3,7,4,3]

//insertion sort
//works by evaluating a constant set of numbers with a secondary set of changing numbers 
//performance: O(n^2)

func insertionSort() {
    print("insertionSort()")
    print("unsorted numberList: \(numberList)")
    var x, y, key: Int
    
    for (x = 0; x < numberList.count; x++) {
        //obtain a number to evaluate (a key)
        key = numberList[x]
        
        //iterate in reverse order through the sorted population
        for (y = x; y >= 0; y--) {
            if key < numberList[y] {
                //remove item (key's position) from original position
                numberList.removeAtIndex(y+1)
                
                //insert the number at the key position
                numberList.insert(key, atIndex: y)
            }
        } //end of for loop
    } //end of for loop
    
    print("sorted numberList: \(numberList)")
}

insertionSort()

numberList = [8,2,4,6,11,13,3,7,4,3]
//bubble sort
//works by comparing values and swapping with small values
//performance: O(n^2)

func bubbleSort() {
    print("bubbleSort()")
    print("unsorted numberList: \(numberList)")
    var x, y, z, passes, key : Int
    
    //track collection iterations
    for x in 0..<numberList.count {
        passes = (numberList.count - 1) - x
        
        //use shorthand range operator
        for y in 0..<passes {
            key = numberList[y]
            
            //compare and rank values (bubble up to the top)
            if key > numberList[y+1] {
                z = numberList[y+1] //get value to swap
                numberList[y+1] = key //swap key
                numberList[y] = z //swap lower value
            }
        } //end for loop
    } //end for loop
    print("sorted numberList: \(numberList)")
}

bubbleSort()

numberList = [8,2,4,6,11,13,3,7,4,3]

//quick sort
//works by using a pivot value (any random value), then reorder array so that all elements with values less than pivot come before and all greater values come after pivot. After this "partitioning" pivot is in final position, recursively apply the previous steps to the sub array of small values and greater values.
//performance: O(n log n) best case, O(n^2) worst case

// low is the index of the leftmost element of the subarray
// high is the index of the rightmost element of the subarray (inclusive)
func quickSort(inout arr: [Int], left: Int, right: Int) {
    if left < right {
        let p = partion(&numberList, left: left, right: right)
        quickSort(&arr, left: left, right: p - 1)
        quickSort(&arr, left:p + 1, right:right)
    }
}

func swap(inout arr: [Int], a: Int, b: Int) {
    let temp = arr[a]
    arr[a] = arr[b]
    arr[b] = temp
}

func partion(inout arr: [Int], left: Int, right: Int) -> Int {
    let pivotValue = arr[right]
    var storeIndex = left
    for i in left..<right {
        if arr[i] < pivotValue {
            swap(&arr, a: i, b: storeIndex)
            storeIndex += 1
        }
    }
    swap(&arr, a:storeIndex, b:right)
    return storeIndex
}
print("quickSort()")
print("unsorted numberList: \(numberList)")
quickSort(&numberList, left:0, right: numberList.count-1)
print("sorted numberList: \(numberList)")

//generics version of quicksort
func quicksort<T: Comparable>(inout arr: [T], left: Int, right: Int) {
    if left < right {
        let p = partion(&arr, left:left, right:right)
        quicksort(&arr, left:left, right:p - 1)
        quicksort(&arr, left:p + 1, right:right)
    }
}

func swap<T>(inout arr: [T], a: Int, b: Int) {
    let temp = arr[a]
    arr[a] = arr[b]
    arr[b] = temp
}

func partion<T: Comparable>(inout arr: [T], left: Int, right: Int) -> Int {
    let pivotValue = arr[right]
    var storeIndex = left
    for i in left..<right {
        if arr[i] < pivotValue {
            swap(&arr, a:i, b:storeIndex)
            storeIndex += 1
        }
    }
    swap(&arr, a:storeIndex, b:right)
    return storeIndex
}