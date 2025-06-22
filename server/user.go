package server

import (
	"net/http"

	"github.com/Dheerajkumarsaw/go-dev-ops/db"
	"github.com/gin-gonic/gin"
)

type createUserRequest struct {
	Username string `json:"username" binding:"required,min=1,max=100"`
	Email    string `json:"email" binding:"required,email"`
	Password string `json:"password" binding:"required,min=6,max=100"` // Password should be at least 6 characters long
}

func (server *Server) createUser(ctx *gin.Context) {
	var request createUserRequest
	if err := ctx.ShouldBindJSON(&request); err != nil {
		ctx.JSON(400, errResponse(err))
		return
	}

	args := db.CreateUserParams{
		Username:     request.Username,
		Email:        request.Email,
		PasswordHash: request.Password,
	}
	result, err := server.store.CreateUser(ctx, args)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, errResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, result)
}
