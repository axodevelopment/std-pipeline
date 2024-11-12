package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
)

func main() {
	fmt.Println("App Starting...")
	defer fmt.Println("App Ending ...")

	// from gin tutorial
	router := gin.Default()

	router.GET("/", func(c *gin.Context) {
		c.String(200, "Hello")
	})

	router.Run(":8080")
}
