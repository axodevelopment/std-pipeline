package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
)

type Result struct {
	Status int    `json:"status"`
	Body   string `json:"body"`
}

func main() {
	fmt.Println("App Starting...")
	defer fmt.Println("App Ending ...")

	fmt.Println("This is where i trigger workflow")

	// from gin tutorial
	router := gin.Default()

	router.GET("/", func(c *gin.Context) {

		res := Result{
			Status: 200,
			Body:   "Its a body",
		}

		c.JSON(200, res)

	})

	router.Run(":8080")
}
