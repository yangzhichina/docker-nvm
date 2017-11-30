# docker-nvm
`Node.js` is installed by `nvm` to help avoid `sudo` issues, especially for `ember.js`.

As you know, installation of `ember.js` doesn't use `sudo` because running commands like both `ember install ...` and `npm install ...` will encounter permission problems.

The official tutorial of `ember.js` recommends `nvm`, therefore I made a docker `image` based on `node` `v6.12.0` (a lts version that ember.js loves).

## How to use
1. `git clone` (No more to explain)
2. `cd` to the dir
3. `docker build . -t nvm:6.12` (or other tag names you like, but `nvm:6.12` is prefered)
4. enjoy the image :-)
