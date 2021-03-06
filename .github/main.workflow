workflow "New workflow" {
  on = "push"
  resolves = ["GitHub Action for Docker-1"]
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@76ff57a"
  args = "build -t foobox/test ."
}

action "Docker Registry" {
  uses = "actions/docker/login@76ff57a"
  needs = ["GitHub Action for Docker"]
  args = "--username $DOCKER_USERNAME --password $DOCKER_PASSWORD"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "GitHub Action for Docker-1" {
  uses = "actions/docker/cli@76ff57a"
  needs = ["Docker Registry"]
  args = "push foobox/test"
}
