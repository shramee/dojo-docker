build:
	@docker compose exec dojoengine sozo build

build-local:
	cd ./contracts; sozo build

start:
	docker compose up

indexer:
	@WORLD_ADDR=$$(tail -n1 ./deployed_worlds); \
	docker compose exec dojoengine torii -w $$WORLD_ADDR --rpc http://127.0.0.1:5050

deploy:
	@SOZO_OUT="$$(docker compose exec dojoengine sozo migrate)"; echo "$$SOZO_OUT"; \
	echo "$$SOZO_OUT" | grep "World at address" | rev | cut -d " " -f 1 | rev >> ./deployed_worlds
