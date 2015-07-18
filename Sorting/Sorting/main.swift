//
//  main.swift
//  Sorting
//
//  Created by Ryan Moniz on 2015-07-18.
//  Copyright © 2015 ryanmoniz. All rights reserved.
//
// Basic Sorting algorithm in Swift

import Foundation

//a simple set of integers to sort

var numberList : Array<Int> = [8,2,4,6,11,13,3,7,4,3]

//insertion sort
//works by evaluating a constant set of numbers with a secondary set of changing numbers 
//performance: O(n^2)

func insertionSort() {
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