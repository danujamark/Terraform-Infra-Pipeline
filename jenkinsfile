pipeline {
agent any

environment {
ENV = "$(env.BRANCH_NAME)"
TF_WORKDIR = "environments/${env. BRANCH_NAME}"
}
stages {
 stage ('Checkout') {
  steps {
   git branch: "$(env. BRANCH_NAME)", url: 'https://github.com/danujamark/Terraform-Infra-Pipeline.git'
}
}
stage( 'Terraform Init') {
steps {
dir "$(TF_WORKDIR}") |{
sh 'terraform init'
}
}
}
stage( 'Terraform Plan') {
steps {
dir ("${TF_WORKDIR}") {
sh 'terraform plan -out=tfplan'
sh 'terraform show -no-color tfplan > plan.txt'
sh 'cat plan.txt'
}
}
}
stage( 'Terraform Apply') {
steps {
    input message: "Apply Terraform Plan?", ok: "deploy"
}
}
stage( 'Apply Changes') {
steps {
dir ("${TF_WORKDIR}") {
sh 'terraform apply -auto-approve tfplan'
}
}
}
}
}   