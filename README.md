# Zero-Touch Cloud Portfolio

**Status:** Archived (Infrastructure destroyed via Terraform for cost optimisation)

## The Goal
To build a **Zero-Touch CI/CD pipeline** that deploys a containerised React application to Azure without any manual intervention.

## Architecture

* **Infrastructure as Code:** Terraform (Azure RM Provider)
* **Containerization:** Docker & Azure Container Registry (ACR)
* **Hosting:** Azure Container Apps (Serverless Containers)
* **CI/CD:** GitHub Actions (Build -> Push -> Deploy)
* **Security:** * Service Principal authentication (RBAC)
    * Secrets management via GitHub Secrets
    * Rootless container execution

## Tech Stack
* **Cloud:** Microsoft Azure
* **IaC:** Terraform
* **Pipeline:** GitHub Actions (YAML)
* **Frontend:** React + Vite

##  Key Workflows
1.  **Infrastructure Provisioning:** `terraform apply` builds the ACR, Resource Group, and Container Environment.
2.  **Automated Deployment:** Commits to `master` trigger a Docker build.
3.  **Zero-Downtime Updates:** The pipeline injects the new container image into the running App Environment automatically.

## Cost Optimisation
This project utilises Terraform to strictly manage costs. The entire infrastructure is ephemeral and can be destroyed (`terraform destroy`) to stop billing and rebuilt (`terraform apply`) in minutes.
