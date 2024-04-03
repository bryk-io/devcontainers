# Go 1.22 Dev Container

To build and publish this custom image:

```bash
devcontainer build \
--workspace-folder src/go-1.22 \
--image-name ghcr.io/bryk-io/devcontainer-go:1.22.1 \
--push false
```

Then, to use it on a project you can start with a simple `devcontainer.json`.

```json
{
  "name": "my-project",
  "image": "ghcr.io/bryk-io/devcontainer-go:1.22"
}
```
