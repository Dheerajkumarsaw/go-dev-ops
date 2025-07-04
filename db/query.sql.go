// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.27.0
// source: query.sql

package db

import (
	"context"
)

const createAccount = `-- name: CreateAccount :one
INSERT INTO accounts (owner, balance, currency)
VALUES ($1, $2, $3)
RETURNING id, owner, balance, currency, created_at
`

type CreateAccountParams struct {
	Owner    string
	Balance  int64
	Currency string
}

func (q *Queries) CreateAccount(ctx context.Context, arg CreateAccountParams) (Account, error) {
	row := q.db.QueryRowContext(ctx, createAccount, arg.Owner, arg.Balance, arg.Currency)
	var i Account
	err := row.Scan(
		&i.ID,
		&i.Owner,
		&i.Balance,
		&i.Currency,
		&i.CreatedAt,
	)
	return i, err
}

const createEntry = `-- name: CreateEntry :one
INSERT INTO entries (account_id, amount) 
VALUES ($1, $2)
RETURNING id, account_id, amount, created_at
`

type CreateEntryParams struct {
	AccountID int64
	Amount    int64
}

func (q *Queries) CreateEntry(ctx context.Context, arg CreateEntryParams) (Entry, error) {
	row := q.db.QueryRowContext(ctx, createEntry, arg.AccountID, arg.Amount)
	var i Entry
	err := row.Scan(
		&i.ID,
		&i.AccountID,
		&i.Amount,
		&i.CreatedAt,
	)
	return i, err
}

const createTransfer = `-- name: CreateTransfer :one
INSERT INTO transfers (from_account_id, to_account_id, amount)
VALUES($1, $2, $3)
RETURNING id, from_account_id, to_account_id, amount, created_at
`

type CreateTransferParams struct {
	FromAccountID int64
	ToAccountID   int64
	Amount        int64
}

func (q *Queries) CreateTransfer(ctx context.Context, arg CreateTransferParams) (Transfer, error) {
	row := q.db.QueryRowContext(ctx, createTransfer, arg.FromAccountID, arg.ToAccountID, arg.Amount)
	var i Transfer
	err := row.Scan(
		&i.ID,
		&i.FromAccountID,
		&i.ToAccountID,
		&i.Amount,
		&i.CreatedAt,
	)
	return i, err
}

const createUser = `-- name: CreateUser :one
INSERT INTO users (username, email, password_hash)
VALUES ($1, $2, $3)
RETURNING id
`

type CreateUserParams struct {
	Username     string
	Email        string
	PasswordHash string
}

func (q *Queries) CreateUser(ctx context.Context, arg CreateUserParams) (int64, error) {
	row := q.db.QueryRowContext(ctx, createUser, arg.Username, arg.Email, arg.PasswordHash)
	var id int64
	err := row.Scan(&id)
	return id, err
}

const deleteAccount = `-- name: DeleteAccount :one
DELETE FROM accounts
WHERE id = $1
RETURNING id
`

func (q *Queries) DeleteAccount(ctx context.Context, id int64) (int64, error) {
	row := q.db.QueryRowContext(ctx, deleteAccount, id)
	err := row.Scan(&id)
	return id, err
}

const getAccountById = `-- name: GetAccountById :one
SELECT id, owner, balance, currency, created_at FROM accounts
WHERE id = $1
`

func (q *Queries) GetAccountById(ctx context.Context, id int64) (Account, error) {
	row := q.db.QueryRowContext(ctx, getAccountById, id)
	var i Account
	err := row.Scan(
		&i.ID,
		&i.Owner,
		&i.Balance,
		&i.Currency,
		&i.CreatedAt,
	)
	return i, err
}

const getAccountForUpdate = `-- name: GetAccountForUpdate :one
SELECT id, owner, balance, currency, created_at FROM accounts
WHERE id = $1 LIMIT 1
FOR NO KEY UPDATE
`

func (q *Queries) GetAccountForUpdate(ctx context.Context, id int64) (Account, error) {
	row := q.db.QueryRowContext(ctx, getAccountForUpdate, id)
	var i Account
	err := row.Scan(
		&i.ID,
		&i.Owner,
		&i.Balance,
		&i.Currency,
		&i.CreatedAt,
	)
	return i, err
}

const getAllAccounts = `-- name: GetAllAccounts :many
SELECT id, owner, balance, currency, created_at FROM accounts
ORDER BY id
OFFSET $1
LIMIT $2
`

type GetAllAccountsParams struct {
	Offset int32
	Limit  int32
}

func (q *Queries) GetAllAccounts(ctx context.Context, arg GetAllAccountsParams) ([]Account, error) {
	rows, err := q.db.QueryContext(ctx, getAllAccounts, arg.Offset, arg.Limit)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	items := []Account{}
	for rows.Next() {
		var i Account
		if err := rows.Scan(
			&i.ID,
			&i.Owner,
			&i.Balance,
			&i.Currency,
			&i.CreatedAt,
		); err != nil {
			return nil, err
		}
		items = append(items, i)
	}
	if err := rows.Close(); err != nil {
		return nil, err
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return items, nil
}

const getEntry = `-- name: GetEntry :one
SELECT id, account_id, amount, created_at FROM entries
WHERE id = $1
`

func (q *Queries) GetEntry(ctx context.Context, id int64) (Entry, error) {
	row := q.db.QueryRowContext(ctx, getEntry, id)
	var i Entry
	err := row.Scan(
		&i.ID,
		&i.AccountID,
		&i.Amount,
		&i.CreatedAt,
	)
	return i, err
}

const getTransfer = `-- name: GetTransfer :one
SELECT id, from_account_id, to_account_id, amount, created_at FROM transfers
WHERE id = $1
`

func (q *Queries) GetTransfer(ctx context.Context, id int64) (Transfer, error) {
	row := q.db.QueryRowContext(ctx, getTransfer, id)
	var i Transfer
	err := row.Scan(
		&i.ID,
		&i.FromAccountID,
		&i.ToAccountID,
		&i.Amount,
		&i.CreatedAt,
	)
	return i, err
}

const updateAccountBalance = `-- name: UpdateAccountBalance :one
UPDATE accounts SET balance = $1
WHERE id = $2
RETURNING id, owner, balance, currency, created_at
`

type UpdateAccountBalanceParams struct {
	Balance int64
	ID      int64
}

func (q *Queries) UpdateAccountBalance(ctx context.Context, arg UpdateAccountBalanceParams) (Account, error) {
	row := q.db.QueryRowContext(ctx, updateAccountBalance, arg.Balance, arg.ID)
	var i Account
	err := row.Scan(
		&i.ID,
		&i.Owner,
		&i.Balance,
		&i.Currency,
		&i.CreatedAt,
	)
	return i, err
}
