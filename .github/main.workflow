workflow "Build and publish" {
  resolves = ["registry-login", "registry-push"]
  on = "push"
}

action "registry-login" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "docker-build" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  args = "build -t grahamkennery/docker-node-aws ."
}

action "registry-push" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["registry-login", "docker-build"]
  args = "push grahamkennery/docker-node-aws:latest"
}
