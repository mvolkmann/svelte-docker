# Svelte Docker

This creates a Docker environment for a Svelte project.

Here are the steps to use this:

To create an image named "svelte-project" using the Dockerfile in this directory:
- `docker build -t svelte-project .`
This will replace an existing image with the same name.

To list all the images on this computer:
- `docker images

To delete an image:
- `docker rmi {image-id-prefix}`

A container is a running instance of an image.

To run the image in newly created container:
- `docker run \
    --detach \
    --interactive \
    --tty \
    --rm \
    --publish 127.0.0.1:5000:5000/tcp \
    --volume ~/home/developer/my-app:/home/developer/my-app \
    --name {container-name} /
    {image-name}`
The `--detach` (`-d`) option runs the container in detached mode so it won't automatically exit.
The `--interactive` (`-i`) option keeps STDIN open.
The `--publish` (`-p`) option publishes a container port to a host machine port.
The `--rm` option automatically removes the container when it exits.
The `--tty` (`-t`) option allocates a pseudo-tty that is needed to interact with the process.
The `--volume` (`-v`) option specifies a host machine directory to which a container directory is mounted.

- `docker run -dit svelte-project`

To list all current containers on this computer:
- `docker ps -a`

To stop a running container:
- `docker stop {container-name}`

To delete a container:
- `docker rm {container-id-prefix}

To run an existing container:
- `docker run -a svelte-project`

During iterative development it is common to rebuild an image multiple times.
When an image with the same name as an existing one is built,
the previous version remains but is stripped of its name and tag.
These are referred to as "dangling images".
The following command deletes all dangling images and stopped containers:
- `docker system prune --force`

To open a shell inside a running container:
- `docker exec -it {container-id} /bin/bash

