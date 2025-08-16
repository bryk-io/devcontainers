# Rust Dev Container

To build and publish this custom image:

```bash
devcontainer build \
--workspace-folder src/rust \
--image-name ghcr.io/bryk-io/devcontainer-rust:1.89.0 \
--push false
```

Then, to use it on a project you can start with a simple `devcontainer.json`.

```json
{
  "name": "my-project",
  "image": "ghcr.io/bryk-io/devcontainer-rust:1.89"
}
```
