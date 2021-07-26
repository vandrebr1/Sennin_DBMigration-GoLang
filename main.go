package main

import (
	"database/sql"

	"github.com/vandrebr1/db/utils"

	"github.com/golang-migrate/migrate/v4"
	"github.com/golang-migrate/migrate/v4/database/postgres"
	_ "github.com/golang-migrate/migrate/v4/source/file"
	_ "github.com/lib/pq"
)

func main() {

	config, err := utils.LoadConfig(".")
	if err != nil {
		panic(err.Error())
	}

	db, err := sql.Open(config.DBDriver, config.DBSource)

	if err != nil {
		panic(err.Error())
	}

	driver, err := postgres.WithInstance(db, &postgres.Config{})

	if err != nil {
		panic(err.Error())
	}

	m, err := migrate.NewWithDatabaseInstance("file://migrations", "postgres", driver)

	if err != nil {
		panic(err.Error())
	}

	m.Up()

	defer db.Close()
}
