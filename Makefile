ifneq (,$(wildcard ./.env))
include .env
export 
ENV_FILE_PARAM = --env-file .env

endif

act:
	source env/Scripts/activate

build:
	docker-compose up --build -d --remove-orphans

up:
	docker-compose up -d

down:
	docker-compose down

show-logs:
	docker-compose logs

serv:
	npm run start:dev


mmig: # run with "make mmig" or "make mmig message='migration message'"
	if [ -z "$(message)" ]; then \
		npx zenstack generate; \
	else \
		npx prisma migrate --name "$(message)"; \
	fi
	
mig:
	npx prisma db push

init:
	npm run initial-data

tests:
	npm test

reqm:
	npm install