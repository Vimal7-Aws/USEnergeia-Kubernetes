#!/usr/bin/env bash

echo "Checking for google cli..."


echo "EXECUTING: terraform init"
terraform init

echo "Executing: Terraform get"
terraform get


echo "EXECUTING: terraform plan"
terraform plan