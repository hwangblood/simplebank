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

- Lecture #4:
