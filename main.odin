package main

import "core:fmt"

width :: 60
height :: 50

rule :: proc(state: [width]int) -> [width]int {
	state1 := [width]int{}

	// Rules: https://en.wikipedia.org/wiki/Rule_110
	for i := 0; i < width; i += 1 {
		start := (i == 0) ? (i) : (i-1)
		end := (i == width-1) ? (i) : (i+1)
		if      state[start] == 0 && state[i] == 0 && state[end] == 0 do state1[i] = 0
		else if state[start] == 0 && state[i] == 0 && state[end] == 1 do state1[i] = 1
		else if state[start] == 0 && state[i] == 1 && state[end] == 0 do state1[i] = 1
		else if state[start] == 0 && state[i] == 1 && state[end] == 1 do state1[i] = 1
		else if state[start] == 1 && state[i] == 0 && state[end] == 0 do state1[i] = 0
		else if state[start] == 1 && state[i] == 0 && state[end] == 1 do state1[i] = 1
		else if state[start] == 1 && state[i] == 1 && state[end] == 0 do state1[i] = 1
		else if state[start] == 1 && state[i] == 1 && state[end] == 1 do state1[i] = 0
	}

	return state1
}

main :: proc() {
	state := [width]int{} // Make state variable
	state[width-1] = 1 // Start pattent

	for i := 0; i < height; i += 1 {
		state = rule(state)
		for j := 0; j < width; j += 1 {
			fmt.print((state[j] == 1) ? "<" : " ")
		}
		fmt.println("");
	}
}
