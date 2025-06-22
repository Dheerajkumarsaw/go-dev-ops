db-schema: 
	sqlc generate

test:
	go test -v -cover ./...

mock:
	mockgen -destination db/mock/store.go -package mockdb github.com/Dheerajkumarsaw/go-dev-ops/db Store

new-migration:
	dbmate new $(path)

db-migrate:
	@if [ -n "$(file)" ]; then \
		echo "Running single migration: $(file)"; \
		dbmate -e DATABASE_URL up db/migrations/$(file); \
	else \
		echo "Running all migrations"; \
		dbmate -e DATABASE_URL up; \
	fi

.PHONY: postgres createdb dropdb migratedb migratedown sqlc test mock