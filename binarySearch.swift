//
//  binarySearch.swift
//
//  Created by Liam Csiffary
//  Created on 2022-04-06
//  Version 1.0
//  Copyright (c) 2021 IMH. All rights reserved.
//
//  The binarySearcher program uses a binary search algorithm to find out if a certain
//  number does or doesn’t appear in the array. It also finds all other indices 
//  for which that number appears


func binarySearcher(array: [Int], i: Int, leftVar: Int, rightVar: Int) -> Int {
  let mid = (rightVar - leftVar) / 2 + leftVar

  if (rightVar <= leftVar) {
    return -1
  } else if (array[mid] == i) {
    return mid
  } else if (array[mid] > i) {
    return binarySearcher(array: array, i: i, leftVar: leftVar, rightVar: mid - 1)
  } else {
    return binarySearcher(array: array, i: i, leftVar: mid + 1, rightVar: rightVar)
  }
}


func isElseWhere(array: [Int], initIndex: Int) -> String {
    // gets the number the function should be looking for
  let numToLookFor = array[initIndex]
  var curNum = numToLookFor
  var counter = 0
  var longerArray = array
  longerArray.append(0)
  longerArray.insert(-1, at: 0)

  // these are the strings that we will pass back to the function
  var range1 = ""
  var range2 = ""

  // finds the numbers to the left of the initial index
  while (curNum == numToLookFor) {
    counter += 1
    curNum = longerArray[initIndex - counter]
  }
  range1 += String(initIndex - counter + 1)


  curNum = numToLookFor
  counter = 0
  // finds the numbers to the right of the initial index
  while (curNum == numToLookFor) {
    counter += 1
    curNum = longerArray[initIndex + counter]
  }
  range2 += String(initIndex + counter - 2)

  
  // if range1 != range2 then return the new range of that number
  if (range1 != range2) {
    return "indices " + range1 + "-" + range2
  } else {
    // otherwise return the initial index
    return "index " + range1
  }
}


func main() {
  // define vars
  var lengthOfArray = 0
  var maxNum = 0

  // greet user, gets the users input for how long the list should be
  // and teh range of numbers that the array should be populated with
  print("Welcome! This program finds a number in a list!\n")
  print("How many numbers would you like to have in the array?")
  while (true) {
    lengthOfArray = Int(readLine()!) ?? 0
    if (lengthOfArray <= 0) {
      print("Please input an integer greater than 0")
    } else {
      break
    }
  }

  print("Up to what number should the array be populated with 0-?")
  while (true) {
    maxNum = Int(readLine()!) ?? 0
    if (maxNum <= 0) {
      print("Please input an integer greater than 0")
    } else {
      break
    }
  }

  // creates the array then sorts it
  var arrayOfNums: [Int] = []
  for _ in 0..<lengthOfArray {
    arrayOfNums.append(Int.random(in: 1..<maxNum))
  }
  arrayOfNums.sort()

  print(arrayOfNums)

  // generates a random num to look for in the array
  let numToLookFor = Int.random(in: 1..<maxNum)

  // gets the index that the number appears at, or if it doesn't appear
  let index = binarySearcher(
      array: arrayOfNums, i: numToLookFor, leftVar: 0, rightVar: arrayOfNums.count)

  // if the number was not in the array
  if (index == -1) {
    print("The number ", numToLookFor, " does not appear in this array")
  } else { // if it is get all the other indecies at which that number also appears
    let indexRange = isElseWhere(array: arrayOfNums, initIndex: index)
    print("The number ", numToLookFor, " appears at index ", indexRange)
  }
}

// start the program
main()
