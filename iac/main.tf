terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.20.0"
    }
  }
}

provider "github" {
  token = var.token # or `GITHUB_TOKEN`
  base_url = var.base_url
  owner = var.owner
}

resource "github_team" "some_team" {
  name        = "some-team"
  description = "Some cool team"
  privacy     = "closed"
}

resource "github_repository" "tfdemo" {
  name        = "tf-demo"
  description = "My awesome github terraform codebase"

  visibility = "public"
  has_issues = true
  auto_init = true

#   template {
#     owner      = "github"
#     repository = "terraform-module-template"
#   }

}

resource "github_branch" "dev" {
  repository = github_repository.tfdemo.name
  branch     = "dev"
}


