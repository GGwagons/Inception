COMPOSE = ./srcs/docker-compose.yml
DATA_DIRS := /home/${USER}/data/mariadb \
			/home/${USER}/data/wordpress

check-dirs:
	@for dir in $(DATA_DIRS); do \
		if [ ! -d $$dir ]; then \
			echo "Creating directory $$dir"; \
			mkdir -p $$dir; \
		fi; \
	done

remove-volumes:
	@docker volume rm srcs_mariadb srcs_wordpress || true

all: up

up: check-dirs
	docker compose -f $(COMPOSE) up --build

stop:
	docker compose -f $(COMPOSE) stop

down:
	docker compose -f $(COMPOSE) down

re: down remove-volumes
	docker compose -f $(COMPOSE) build --no-cache
	docker compose -f $(COMPOSE) up -d

prune:
	docker system prune -f

clean:
	@docker volume rm srcs_mariadb srcs_wordpress 2>/dev/null || true

fclean: down
	@sudo rm -rf /home/${USER}/data || true
	@docker volume rm srcs_mariadb srcs_wordpress 2>/dev/null || true
	@docker image prune -a -f > /dev/null 2>&1 || true
	@echo "srcs-mariadb:latest" | xargs docker rmi -f > /dev/null 2>&1 || true
	@echo "srcs-nginx:latest" | xargs docker rmi -f > /dev/null 2>&1 || true
	@echo "srcs-wordpress:latest" | xargs docker rmi -f > /dev/null 2>&1 || true
	@docker system prune -f > /dev/null 2>&1 || true

.PHONY: all up stop down re prune clean fclean