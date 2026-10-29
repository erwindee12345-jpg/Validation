package main

import (
	"fmt"
	"os"
)

var apiKey = os.Getenv("API_KEY")

func isAuthorized(provided string) bool {
	if apiKey == "" {
		return false
	}
	//CWE 208 Timing side channel
	return provided == apiKey
}

func main() {
	
}