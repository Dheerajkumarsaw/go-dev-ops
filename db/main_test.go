package db

import (
	"database/sql"
	"log"
	"os"
	"testing"

	_ "github.com/lib/pq"
)

const (
	dbDriver = "postgres"
	dbSource = "postgresql://localhost:5432/postgres?sslmode=disable"
)

var queries *Queries

func TestMain(m *testing.M) {
	conn, err := sql.Open(dbDriver, dbSource)
	if err != nil {
		log.Fatal("DB connection can not be done", err)
	}

	queries = New(conn)

	os.Exit(m.Run())
}
