package main

import ("fmt")

func simpleInsertionSort(A []int) []int{
	return insertionSort(A, true, false)
}

func insertionSort(A []int, ascend bool, debug bool) []int{
	if debug {
		fmt.Println("Start sorting: ", A)
	}
	for j := 1; j < len(A); j++ {
		key := A[j]
		i := j - 1
		if ascend {
			for i > -1 && A[i] > key {
				A[i+1] = A[i]
				i = i - 1
			}
		}else{
			for i > -1 && A[i] < key {
				A[i+1] = A[i]
				i = i - 1
			}
		}
		A[i+1] = key
		if debug {
			fmt.Println("Sorting: ", A)
		}
	}
	if debug {
		fmt.Println("End sorting: ", A)
	}
	return A
}

func main() {
	tobesorted := [10]int{3, 5, 1, 2, 4, 9, 8, 7, 6, 0}
	// fmt.Println("Hi")
	fmt.Println(insertionSort(tobesorted[:], false, true))
	fmt.Println(tobesorted[:])
}