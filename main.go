package main

import (
	"database/sql"
	"log"

	"github.com/Dheerajkumarsaw/go-dev-ops/db"
	"github.com/Dheerajkumarsaw/go-dev-ops/server"
	_ "github.com/lib/pq"
)

const (
	dbDriver = "postgres"
	dbSource = "postgresql://localhost:5432/postgres?sslmode=disable"
	address  = "0.0.0.0:8080"
)

func main() {
	conn, err := sql.Open(dbDriver, dbSource)
	if err != nil {
		log.Fatal("DB connection can not be done", err)
	}
	store := db.NewStore(conn)
	server := server.NewServer(store)

	server.Start(address)
}
