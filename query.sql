-- name: CreateAccount :one
INSERT INTO accounts (owner, balance, currency)
VALUES ($1, $2, $3)
RETURNING *;

-- name: GetAccountById :one
SELECT * FROM accounts
WHERE id = $1;

-- name: GetAllAccounts :many
SELECT * FROM accounts
ORDER BY id
OFFSET $1
LIMIT $2;

-- name: UpdateAccountBalance :one
UPDATE accounts SET balance = $1
WHERE id = $2
RETURNING *;

-- name: DeleteAccount :one
DELETE FROM accounts
WHERE id = $1
RETURNING id;

-- name: CreateTransfer :one
INSERT INTO transfers (from_account_id, to_account_id, amount)
VALUES($1, $2, $3)
RETURNING *;

-- name: CreateEntry :one
INSERT INTO entries (account_id, amount) 
VALUES ($1, $2)
RETURNING *;

-- name: GetTransfer :one
SELECT * FROM transfers
WHERE id = $1;

-- name: GetEntry :one 
SELECT * FROM entries
WHERE id = $1;

-- name: GetAccountForUpdate :one
SELECT * FROM accounts
WHERE id = $1 LIMIT 1
FOR NO KEY UPDATE;

-- name: CreateUser :one
INSERT INTO users (username, email, password_hash)
VALUES ($1, $2, $3)
RETURNING id;