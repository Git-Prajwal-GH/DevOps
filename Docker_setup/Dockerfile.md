🧱 Core Dockerfile Instructions

Instruction  Description
- FROM : Specifies the base image to use (must be the first instruction).
- LABEL : Adds metadata to an image (e.g., maintainer info).
- ENV : Sets environment variables inside the container.
- WORKDIR : Sets the working directory for any subsequent RUN, CMD, COPY, etc.
- COPY : Copies files/directories from your local machine into the image.
- ADD : Similar to COPY, but also handles remote URLs and archive unpacking.
- RUN : Executes a command inside the image at build time (e.g., installing packages).
- CMD : Sets the default command to run when the container starts (can be overridden).
- ENTRYPOINT : Sets a fixed command to run; often used with CMD to provide arguments.
- EXPOSE : Documents the port the container will listen on at runtime (optional).
- VOLUME : Creates a mount point for external volumes.
- ARG : Defines build-time variables (only available during the build).
- USER : Sets the user that will run the container processes.
- HEALTHCHECK : Defines a command to test if the container is healthy.
- ONBUILD : Adds a trigger instruction to be executed when the image is used as a base.
- SHELL : Overrides the default shell used by RUN commands.
