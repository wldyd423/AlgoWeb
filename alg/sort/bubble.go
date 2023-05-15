package main

import ("fmt")

func bubbleSort(A []int, ascend bool, debug bool){
	for i := 0; i < len(A); i++{
		for j := len(A) - 1; j > i; j--{
			if ascend{
				if A[j] < A[j-1]{
					A[j], A[j-1] = A[j-1], A[j]
				}
			}else{
				if A[j] > A[j-1]{
					A[j], A[j-1] = A[j-1], A[j]
				}
			}
			if debug{
				fmt.Println("Sorting: ", A)
			}
		}
	}
}

func main(){
	tobesorted := [10]int{3, 5, 1, 2, 4, 9, 8, 7, 6, 0}
	bubbleSort(tobesorted[:], true, true)
	fmt.Println(tobesorted[:])
}