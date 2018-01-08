build:
	docker pull debian:stretch-slim
	docker build --rm -t lazyfrosch/aptly .
