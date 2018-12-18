workflow "New workflow" {
  on = "push"
  resolves = [
    "GitHub Action for Docker",
    "GitHub Action for Docker-1",
  ]
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@76ff57a"
  args = "build -t blar/docker-test ."
}

action "GitHub Action for Docker-1" {
  uses = "actions/docker/cli@76ff57a"
  args = "uname -a"
}
