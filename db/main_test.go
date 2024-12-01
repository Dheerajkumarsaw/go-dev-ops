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
var testDB *sql.DB

func TestMain(m *testing.M) {
	var err error
	testDB, err = sql.Open(dbDriver, dbSource)
	if err != nil {
		log.Fatal("DB connection can not be done", err)
	}

	queries = New(testDB)

	os.Exit(m.Run())
}
