init-dev: terraform-clean
	cd terraform && terraform init -backend-config=backends/dev.conf

init-prod: terraform-clean
	cd terraform && terraform init -backend-config=backends/prod.conf

plan-dev: init-dev
	cd terraform && terraform plan -var-file=environments/dev.tfvars

apply-dev: init-dev
	cd terraform && terraform apply -var-file=environments/dev.tfvars

apply-dev-ci: init-dev
	cd terraform && terraform apply -var-file=environments/dev.tfvars --auto-approve

destroy-dev: init-dev
	cd terraform && terraform destroy -var-file=environments/dev.tfvars

destroy-dev-ci: init-dev
	cd terraform && terraform destroy -var-file=environments/dev.tfvars --auto-approve

plan-prod: init-prod
	cd terraform && terraform plan -var-file=environments/prod.tfvars

apply-prod: init-prod
	cd terraform && terraform apply -var-file=environments/prod.tfvars

apply-prod-ci: init-prod
	cd terraform && terraform apply -var-file=environments/prod.tfvars --auto-approve

destroy-prod: init-prod
	cd terraform && terraform destroy -var-file=environments/prod.tfvars

destroy-prod-ci: init-prod
	cd terraform && terraform destroy -var-file=environments/prod.tfvars --auto-approve

terraform-clean:
	cd terraform && rm -rf .terraform

ansible-dev: init-dev
	ansible-playbook ansible/playbook.yml -i $(shell cd terraform && terraform output -raw ip), --private-key ~/.ssh/aws/id_rsa_aws -v

ansible-prod: init-prod
	ansible-playbook ansible/playbook.yml -i $(shell cd terraform && terraform output -raw ip), --private-key ~/.ssh/aws/id_rsa_aws -v