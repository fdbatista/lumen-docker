# lumen-docker
Docker image for running Laravel's Lumen applications

**Usage example**
```yml
version: "3"

services:
  app:
    image: fdbatista/lumen:latest
    ports:
      - 8080:8000
    volumes:
    - ./:/app
```
