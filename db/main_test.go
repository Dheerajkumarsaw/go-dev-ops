package db

import (
	"database/sql"
	"log"
	"os"
	"testing"

	"github.com/Dheerajkumarsaw/go-dev-ops/utils"
	_ "github.com/lib/pq"
)

const (
	dbDriver = "postgres"
	dbSource = "postgresql://localhost:5432/postgres?sslmode=disable"
)

var queries *Queries
var testDB *sql.DB

func TestMain(m *testing.M) {
	config, err := utils.LoadConfig(".")
	if err != nil {
		log.Fatal("Cannot load config:", err)
	}
	testDB, err = sql.Open(config.DBDriver, config.DbSource)
	if err != nil {
		log.Fatal("DB connection can not be done", err)
	}

	queries = New(testDB)

	os.Exit(m.Run())
}
