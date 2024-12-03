db-schema: 
	sqlc generate

test:
	go test -v -cover ./...

mock:
	mockgen -destination db/mock/store.go -package mockdb github.com/Dheerajkumarsaw/go-dev-ops/db Store

.PHONY: postgres createdb dropdb migratedb migratedown sqlc test mock