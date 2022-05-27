metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:gWWklBr0zDrNVclEq8B0YNZqKrdCuHfbBT2djI2YUEI="
  retries = 0
  verbose = false
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:gWWklBr0zDrNVclEq8B0YNZqKrdCuHfbBT2djI2YUEI="
  retries = 1
  verbose = false
}

step "terraform-output" {
  wkdir   = "bootstrap"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "bootstrap",
  ]

  sha     = "h1:gWWklBr0zDrNVclEq8B0YNZqKrdCuHfbBT2djI2YUEI="
  retries = 0
  verbose = false
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "a3b3e3dc5d08b8fa6f594f8cca4bcb2b4b41472bc1fc9397b10dbdb9cfba2b5a"
  retries = 0
  verbose = false
}

step "crds" {
  wkdir   = "bootstrap"
  target  = "bootstrap/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "bootstrap",
  ]

  sha     = "h1:nhHIapbb8otUw2TyOJXWgiKG9wGzIpasqaA4FBJ2Fpw="
  retries = 0
  verbose = false
}

step "bounce" {
  wkdir   = "bootstrap"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "bootstrap",
  ]

  sha     = "h1:tO6EyToA/1mWPPH4VQ/cys9yTSP5H2BoWESWkQ8SGgI="
  retries = 1
  verbose = false
}
