# Docker Test: Sample Node.js App with Docker

This repository demonstrates how to set up and run a simple Node.js application using Docker. It also includes practical Docker commands to help students understand the basics of Docker containers, volumes, and bind mounts.

The example app is a Node.js server built with Express, and the repository includes a `Dockerfile` to containerize the app. This project is perfect for beginners looking to explore Docker.

---

## Table of Contents

1. [Getting Started](#getting-started)
2. [Docker Commands Explained](#docker-commands-explained)
   - [Building a Docker Image](#building-a-docker-image)
   - [Running a Container](#running-a-container)
   - [Using Docker Volumes](#using-docker-volumes)
   - [Using Bind Mounts](#using-bind-mounts)
3. [Running the Sample Node.js App](#running-the-sample-nodejs-app)

---

## Getting Started

Clone this repository to your local machine:

```bash
git clone https://github.com/noor8271/Docker_test.git
cd Docker_test
```

Ensure Docker is installed on your system. You can download Docker from [here](https://www.docker.com/).
You Need to have WSL (windows subsystem for linux) if using on windows machines.

---

## Docker Commands Explained

### Building a Docker Image

A Docker image packages the environment and dependencies for your application. Here's an example of building an Ubuntu-based image with additional tools:

1. Create a `Dockerfile`:
   ```dockerfile
   FROM ubuntu:22.04
   RUN apt update && apt install iputils-ping --yes
   ```
2. Build the Docker image:
   ```bash
   docker build --tag my-ubuntu -f Dockerfile .
   ```
3. Clean up by removing the `Dockerfile`:
   ```bash
   rm Dockerfile
   ```

### Running a Container

Run the container interactively and test commands like `ping`:
```bash
docker run -it --rm my-ubuntu
```

Inside the container:
```bash
ping google.com
# Stop the ping with Ctrl+C, then exit
exit
```

### Using Docker Volumes

Volumes allow you to persist data across container runs. Here's how:

1. Create a volume:
   ```bash
   docker volume create my-volume
   ```
2. Run a container with the volume mounted:
   ```bash
   docker run --rm -it --mount source=my-volume,destination=/my-data ubuntu:22.04
   ```
3. Inside the container, create and view files:
   ```bash
   echo "Hello, Docker!" > /my-data/hello.txt
   cat /my-data/hello.txt
   exit
   ```
4. Reuse the volume in a new container:
   ```bash
   docker run --rm -it --mount source=my-volume,destination=/my-data ubuntu:22.04
   cat /my-data/hello.txt
   exit
   ```

### Using Bind Mounts

Bind mounts link a directory on your host machine to a directory in the container. This is useful for sharing local files with a container:

1. Run a container with a bind mount:
   ```bash
   docker run -it --rm --mount type=bind,source="${PWD}"/my-data,destination=/my-data ubuntu:22.04
   ```
2. Inside the container, create and view files:
   ```bash
   echo "Hello from bind mount!" > /my-data/hello.txt
   cat /my-data/hello.txt
   exit
   ```

Reuse the container and observe the changes on your host machine!

---

## Running the Sample Node.js App

1. Clone this repository (if not done already):
   ```bash
   git clone <repository-url>
   cd <repository-folder>
   ```

2. Build the Docker image for the Node.js app:
   ```bash
   docker build -t docker-nodeim .
   ```

3. Run the container:
   ```bash
   docker run -it --rm -p 3000:3000 docker-nodeim
   ```

4. Open your browser and navigate to `http://localhost:3000` to interact with the app.

---

## Notes

- The sample commands provided are designed for educational purposes.
- Use `docker --help` for additional information about any Docker command.
- Always clean up unused containers, images, and volumes to save disk space.
- for more learning see resource [here](https://courses.devopsdirective.com/docker-beginner-to-pro/lessons/00-introduction/01-main).

---

Happy Dockerizing! 🚀

