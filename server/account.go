package server

import (
	"database/sql"
	"log"
	"net/http"

	"github.com/Dheerajkumarsaw/go-dev-ops/db"
	"github.com/gin-gonic/gin"
)

type createAccountRequest struct {
	Owner    string `json:"owner" binding:"required"`
	Currency string `json:"currency" binding:"required,oneof=USD INR CAD EUR"`
}

func (server *Server) createAccount(ctx *gin.Context) {
	var req createAccountRequest
	if err := ctx.ShouldBindJSON(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errResponse(err))
		return
	}

	arg := db.CreateAccountParams{
		Owner:    req.Owner,
		Currency: req.Currency,
		Balance:  0,
	}

	account, err := server.store.CreateAccount(ctx, arg)
	if err != nil {
		log.Println(err)
		ctx.JSON(http.StatusInternalServerError, errResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, account)
}

type getAccountRequest struct {
	ID int64 `uri:"id" binding:"required,min=1"` // we can more validation here
}

func (server *Server) getAccount(ctx *gin.Context) {
	var req getAccountRequest

	if err := ctx.ShouldBindUri(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errResponse(err))
		return
	}

	account, err := server.store.GetAccountById(ctx, req.ID)
	if err != nil {
		log.Println(err)
		if err != sql.ErrNoRows {
			ctx.JSON(http.StatusInternalServerError, errResponse(err))
			return
		}
		ctx.JSON(http.StatusNotFound, errResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, account)
}

type listAccountRequest struct {
	PageId    int32 `form:"page_id" binding:"required"` // we can more validation here
	PageLimit int32 `form:"page_limit" binding:"required"`
}

func (server *Server) listAccount(ctx *gin.Context) {
	var req listAccountRequest

	if err := ctx.ShouldBindQuery(&req); err != nil {
		ctx.JSON(http.StatusBadRequest, errResponse(err))
		return
	}
	account, err := server.store.GetAllAccounts(ctx, db.GetAllAccountsParams{
		Limit:  req.PageLimit,
		Offset: (req.PageId - 1) * req.PageLimit,
	})
	if err != nil {
		log.Println(err)
		if err != sql.ErrNoRows {
			ctx.JSON(http.StatusInternalServerError, errResponse(err))
			return
		}
		ctx.JSON(http.StatusNotFound, errResponse(err))
		return
	}
	ctx.JSON(http.StatusOK, account)
}
