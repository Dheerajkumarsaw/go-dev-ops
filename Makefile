db-schema: 
	sqlc generate

test:
	go test -v -cover ./...

.PHONY: postgres createdb dropdb migratedb migratedown sqlc