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