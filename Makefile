# ------------------- dev -------------------
build-dev:
	docker build -f Dockerfile.dev -t front-end-app .

# mount volume with relative path
export ROOT_DIR=${PWD}
run-dev-manual:
	docker run -p 3000:3000 -v /app/node_modules -v ${ROOT_DIR}:/app front-end-app

# with docker-compose
run-dev:
	docker-compose up

run-dev-test:
	docker-compose up --build

# ------------------- production -------------------
build-prod:
	docker build -t front-end-app-prod .

run-prod:
	docker run -p 8080:80 front-end-app-prod