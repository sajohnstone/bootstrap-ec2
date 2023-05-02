export SUBFOLDER ?= .
export CI_PROJECT_NAME ?= docker-volume
export CI_JOB_ID ?= local
export AWS_MOUNT ?= ~/.aws:/root/.aws

plan: init $(INIT_REQUIRED)
	docker-compose run --rm terraform terraform plan
.PHONY: plan

apply: $(INIT_REQUIRED)
	docker-compose run --rm terraform terraform apply
.PHONY: apply

destroy: $(INIT_REQUIRED)
	docker-compose run --rm terraform terraform destroy
.PHONY: destroy

init:
	docker-compose run --rm terraform terraform init
.PHONY: init

validate:
	docker-compose run --rm terraform terraform validate
.PHONY: validate

fmt:
	docker-compose run --rm terraform terraform fmt
.PHONY: fmt

version:
	docker-compose run --rm terraform terraform --version
.PHONY: fmt

shell:
	docker-compose run --rm terraform sh
.PHONY: shell