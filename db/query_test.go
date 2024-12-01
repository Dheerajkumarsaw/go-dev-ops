package db

import (
	"context"
	"database/sql"
	"testing"
	"time"

	"github.com/stretchr/testify/require"
)

func createRandomAccount(t *testing.T) Account {
	arg := CreateAccountParams{
		Owner:    "Dheeraj",
		Balance:  100,
		Currency: "USD",
	}

	account, err := queries.CreateAccount(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, account)
	require.Equal(t, arg.Owner, account.Owner)
	require.Equal(t, arg.Currency, account.Currency)
	require.Equal(t, arg.Balance, account.Balance)
	require.NotZero(t, account.ID)
	require.NotZero(t, account.CreatedAt)

	return account
}
func TestCreateAccount(t *testing.T) {
	createRandomAccount(t)
}

func TestGetAccount(t *testing.T) {
	createdAccount := createRandomAccount(t)
	getAccount, err := queries.GetAccountById(context.Background(), createdAccount.ID)
	require.NoError(t, err)
	require.NotEmpty(t, getAccount)
	require.Equal(t, createdAccount.Owner, getAccount.Owner)
	require.Equal(t, createdAccount.Currency, getAccount.Currency)
	require.Equal(t, createdAccount.Balance, getAccount.Balance)
	require.Equal(t, createdAccount.ID, getAccount.ID)
	require.WithinDuration(t, createdAccount.CreatedAt.Time, getAccount.CreatedAt.Time, time.Second)
}

func TestUpdateAccount(t *testing.T) {
	createdAccount := createRandomAccount(t)

	arg := UpdateAccountBalanceParams{
		ID:      createdAccount.ID,
		Balance: 200,
	}

	updatedAccount, err := queries.UpdateAccountBalance(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, updatedAccount)
	require.Equal(t, createdAccount.ID, updatedAccount.ID)
	require.Equal(t, updatedAccount.Balance, arg.Balance)

}

func TestDeleteAccount(t *testing.T) {
	createdAccount := createRandomAccount(t)

	deletedAccount, err := queries.DeleteAccount(context.Background(), createdAccount.ID)
	require.NoError(t, err)

	getDeletedAccount, err := queries.GetAccountById(context.Background(), deletedAccount)
	require.Error(t, err)
	require.EqualError(t, err, sql.ErrNoRows.Error())
	require.Empty(t, getDeletedAccount)
}

func TestListAccount(t *testing.T) {
	for range int32(10) {
		createRandomAccount(t)
	}

	allAccounts, err := queries.GetAllAccounts(context.Background(), GetAllAccountsParams{Limit: 10, Offset: 5})
	require.NoError(t, err)
	require.Len(t, allAccounts, 10)

	for _, ac := range allAccounts {
		require.NotEmpty(t, ac)

	}
}
