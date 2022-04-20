init: terraform-clean
	cd terraform && terraform init

plan: init
	cd terraform && terraform plan

apply: init
	cd terraform && terraform apply

apply-ci: init
	cd terraform && terraform apply --auto-approve

destroy: init
	cd terraform && terraform destroy

destroy-ci: init
	cd terraform && terraform destroy --auto-approve

terraform-clean:
	cd terraform && rm -rf .terraform

ansible: init
	ansible-playbook ansible/playbook.yml -i $(shell cd terraform && terraform output -raw ip), --private-key ~/.ssh/aws/id_rsa_aws -v