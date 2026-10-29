package main

import (
	"fmt"
	"os"
)

import (
	"crypto/sha256"
	"crypto/subtle"
)

var apiKey = os.Getenv("API_KEY")


func isAuthorized(provided string) bool {
	if apiKey == "" {
		return false
	}
	a := sha256.Sum256([]byte(provided))
	b := sha256.Sum256([]byte(apiKey))
	//FIX: Use constant-time comparison functions
	return subtle.ConstantTimeCompare(a[:], b[:]) == 1
}

func main() {
	
}