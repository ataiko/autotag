
TAG := 1.1.1

.PHONY: build
build: 
	docker build -t ataiko/autotag -f ./Dockerfile .

.PHONY: push
push: 
	docker tag ataiko/autotag ataiko/autotag:latest
	docker push ataiko/autotag:latest
	docker tag ataiko/autotag ataiko/autotag:v${TAG}
	docker push ataiko/autotag:v${TAG}

.PHONY: verify
verify: 
	docker run -v ${PWD}:/data -w /data ataiko/autotag -n

.PHONY: publish
publish: build push verify