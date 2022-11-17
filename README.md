# Kaggle API in Docker

Simple Dockerfile with a [Kaggle API](https://github.com/Kaggle/kaggle-api) package. May be used in cases when you do not have access to install the package directly.

Requires `~/.kaggle/kaggle.json` file to work (as described in [original readme](https://github.com/Kaggle/kaggle-api#api-credentials)).

## Instructions

1. Build an image:

```bash
bash build.sh
```

2. Start a container providing a path to a shared directory. For example, it may be a `~/Datasets` directory if you want to download a dataset.

```bash
bash start.sh [SHARED_DIR]
```

3. Enter the container's bash:

```bash
bash into.sh
```
