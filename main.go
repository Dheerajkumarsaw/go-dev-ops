package main

import (
	"database/sql"
	"log"

	"github.com/Dheerajkumarsaw/go-dev-ops/db"
	"github.com/Dheerajkumarsaw/go-dev-ops/server"
	"github.com/Dheerajkumarsaw/go-dev-ops/utils"
	_ "github.com/lib/pq"
)

func main() {

	config, err := utils.LoadConfig(".")
	if err != nil {
		log.Fatal("Cannot load config:", err)
	}
	conn, err := sql.Open(config.DBDriver, config.DbSource)
	if err != nil {
		log.Fatal("DB connection can not be done", err)
	}
	store := db.NewStore(conn)
	server := server.NewServer(store)

	server.Start(config.ServerAddress)
}
