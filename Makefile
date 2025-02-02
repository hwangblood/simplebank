createdb:
	docker exec -it simplebank-db createdb --username=root --owner=root simplebank

dropdb:
	docker exec -it simplebank-db dropdb simplebank

migrateup:
	migrate --path db/migration -database "postgresql://root:foobarbaz@localhost:5432/simplebank?sslmode=disable" -verbose up

migratedown:
	migrate --path db/migration -database "postgresql://root:foobarbaz@localhost:5432/simplebank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test: 
	# verbose logs, report coverage, use ./... to run unit tests in all of them
	go test -v -cover ./...

.PHONY: createdb dropdb migrateup migratedown sqlc test