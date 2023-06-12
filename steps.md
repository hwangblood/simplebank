# Section 1: Working with database [Postgres]

- Lecture #1: [Design DB schema and generate SQL code with dbdiagram.io](https://www.youtube.com/watch?v=rx6CPDK_5mU&list=PLy_6D98if3ULEtXtNSY_2qN21VCKgoQAE&index=1)

  [Simple Bank - dbdiagram.io](https://dbdiagram.io/d/647ab0a0722eb77494507465)

- Lecture #2: [Install & use Docker + Postgres + TablePlus to create DB schema](https://www.youtube.com/watch?v=Q9ipbLeqmQo&list=PLy_6D98if3ULEtXtNSY_2qN21VCKgoQAE&index=2)

  https://hub.docker.com/_/postgres

  ```shell
  docker volume create simplebank-data

  docker run -d \
          --name simplebank-db \
          -e POSTGRES_USER=root \
          -e POSTGRES_PASSWORD=foobarbaz \
          -e POSTGRES_DB=simplebank \
          -v simplebank-data:/var/lib/postgresql/data \
          -p 5432:5432 \
          postgres:15.1-alpine

  docker exec -it simplebank-db psql -U root

  docker logs simplebank-db
  ```

- Lecture #3: [How to write & run database migration in Golang](https://www.youtube.com/watch?v=0CYkrGIJkpw&list=PLy_6D98if3ULEtXtNSY_2qN21VCKgoQAE&index=3)

  [Database migrations. CLI and Golang library. - GitHub](https://github.com/golang-migrate/migrate)

  ```shell
  migrate create -ext sql -dir db/migration -seq init_schema
  
  make createdb
  make dropdb
  make migrateup
  make migratedown
  ```

- Lecture #4: [Generate CRUD Golang code from SQL | Compare db/sql, gorm, sqlx & sqlc](https://youtu.be/prh0hTyI1sU?list=PLy_6D98if3ULEtXtNSY_2qN21VCKgoQAE)

  - https://pkg.go.dev/database/sql (Easy to make mistakes, not caught until runtime)
  - https://gorm.io (Must learn gorm's function, Run slowly on high load)
  - https://github.com/jmoiron/sqlx (Failure won't occur until runtime)
  - https://sqlc.dev (Catch SQL query errors before generating codes)

  ```shell
  go install github.com/kyleconroy/sqlc/cmd/sqlc@latest
  
  go mod init github.com/hwangblood/simplebank
  
  make sqlc
  ```

- Lecture #5: [Write Golang unit tests for database CRUD with random data](https://youtu.be/phHDfOHB2PU?list=PLy_6D98if3ULEtXtNSY_2qN21VCKgoQAE)

  - [lib/pq: Pure Go Postgres driver for database/sql - GitHub](https://github.com/lib/pq)
  - [stretchr/testify: A toolkit with common assertions and mocks that plays nicely with the standard library - GitHub](https://github.com/stretchr/testify)

  ```shell
  go get github.com/lib/pq
  go get github.com/stretchr/testify
  
  make test
  ```

- Lecture #6: [A clean way to implement database transaction in Golang](https://youtu.be/gBh__1eFwVI?list=PLy_6D98if3ULEtXtNSY_2qN21VCKgoQAE)
