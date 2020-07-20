FROM node:current-alpine

EXPOSE 5000
# Doesn't work without this!
ENV HOST=0.0.0.0

# The apk update command updates the index of available packages.
# The apk add command adds and upgrades packages.
# Using --no-cache in the apk commands below keeps the image size small.
# The effect of the cd command only lasts for its RUN command.
RUN \
  apk update --no-cache && \
  apk add --no-cache bash git vim

USER node
WORKDIR /home/node

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
