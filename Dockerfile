# PROBLEM #1: Getting "npx degit" to work with using the non-root, non-node user.

FROM node:current-alpine

EXPOSE 5000
# Doesn't work without this!
ENV HOST=0.0.0.0

# To get these values in the host system, enter the id command.
# 1000 is the existing group id of the "node" user.
ENV GID=1000
# 1000 is the user id of the "node" user.
ENV UID=1001

ENV APP_NAME=svelte-app
ENV GROUP_NAME=node
#ENV USER_NAME=dev
ENV USER_NAME=node
ENV HOME_DIR=/home/$USER_NAME

# The apk update command updates the index of available packages.
# The apk add command adds and upgrades packages.
# Using --no-cache in the apk commands below keeps the image size small.
# Delete the node user which has gid 1000 and uid 1000.
# Create a new group and a new user.
# Create the directory structure for a new Svelte app.
# The effect of the cd command only lasts for its RUN command.
RUN \
  apk update --no-cache && \
  apk add --no-cache bash git vim
  #deluser node && \
  #adduser --disabled-password --shell /bin/bash $USER_NAME
  # Why does Dorian use --gecos, --gid, and --uid?
  #adduser --disabled-password --gecos "" --gid $GID --uid $UID --shell /bin/bash $USER_NAME

USER $USER_NAME
WORKDIR $HOME_DIR

RUN \
  pwd && \
  id && \
  # This works as the root or node user, but not as the dev user.
  npx degit sveltejs/template $APP_NAME && \
  cd $APP_NAME && \
  # The next command outputs
  # "SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents".
  # fsevents is a Mac-specific library.
  # There seems to be no way to avoid this warning.
  # See https://github.com/npm/cli/pull/169.
  npm install


# This keeps the container running as a bash shell.
ENTRYPOINT ["/bin/bash"]

#RUN git config --global user.name "R. Mark Volkmann"
#RUN git config --global user.email "r.mark.volkmann@gmail.com"

#RUN npm install -D @rollup/plugin-commonjs
#RUN npm install -D @rollup/plugin-json
#RUN npm install -D @rollup/plugin-node-resolve
#RUN npm install -D cypress
#RUN npm install -D eslint
#RUN npm install -D eslint-plugin-import
#RUN npm install -D eslint-plugin-svelte3
#RUN npm install -D npm-run-all
#RUN npm install -D prettier
#RUN npm install -D prettier-plugin-svelte
#RUN npm install -D rollup
#RUN npm install -D rollup-plugin-livereload
#RUN npm install -D rollup-plugin-svelte
#RUN npm install -D rollup-plugin-terser
#RUN npm install -D storybook
#RUN npm install -D svelte
#RUN npm install -D svelte-jester
#RUN npm install -D svelte-loader
