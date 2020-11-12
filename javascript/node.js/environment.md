# Setting up a Node.js development environment

### [NVM](https://github.com/nvm-sh/nvm)

1. Install NVM, choose the version (note the version number in the URL, change
   as appropriate).

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash
```

2. _Optional_: install [ZSH/oh-my-zsh plugin](https://github.com/lukechilds/zsh-nvm),
   if you do, consider removing the lines added to .bashrc, .profile, .zshrc,
   etc. by the installation script.

- instructions specific for oh-my-zsh are
  [here](https://github.com/lukechilds/zsh-nvm#as-an-oh-my-zsh-custom-plugin)

### Node.js

- List installed versions:

```
nvm ls
```

- Install the latest (stable/LTS) Node.js version, and attempt to upgrade to the latest
  working npm for that version:

```
nvm install node --latest-npm
```

- List all available versions:

```
nvm ls-remote
```

- Install a specific Node.js version, and attempt to upgrade to the latest
  working npm for that version:

```
nvm install <version> --latest-npm
```

- Update a Node.js version (as in same major version, different in the
  others), install the latest npm and keep all the global packages already
  installed:

```
$ nvm install <version> --reinstall-packages-from=<version> --latest-npm
```

### NPM & Yarn

NPM and Yarn should be installed globally, without having to keep track of the
versions for every node version installed.

[Source for the setup, optimizations and tricks](https://yoember.com/nodejs/the-best-way-to-install-node-js-with-yarn/#advanced-tips-for-setting-up-yarn)

1. Check NPM installation:

```
npm -v
```

2. Update NPM if needed:

```
npm install npm@latest -g
```

3. install yarn locally then use it to install itself globally:

```
npm i -g yarn
yarn global add yarn
npm rm -g yarn
```

3. _Not recommended for now_: you could install NPM globally via Yarn and then remove it locally:
   **But** would you then have to remove it for every new node version or update?

```
yarn global add npm
npm rm -g npm
```

### Automatic version switching

- [avn](https://github.com/wbyoung/avn) seems to not be supported anymore, not
  recommended at this time.

- My current personal zsh script to do the same job (WIP):

  ```
  autoload -U add-zsh-hook
  load-node-version() {
    if [[ -f .node-version && -r .node-version ]]; then
      local new_version=$(<.node-version)
      nvm use $new_version
    fi
  }
  # place this after nvm initialization!
  node-use-file-version() {
    if [[ -f .nvmrc && -r .nvmrc ]]; then
      nvm use
    elif [[ -f .node-version && -r .node-version ]]; then
      load-node-version
    elif [[ "$(nvm version)" != "$(nvm version default)" ]]; then
      echo "Reverting to nvm default version"
      nvm use default
    fi
  }

  add-zsh-hook chpwd node-use-file-version
  node-use-file-version

  ```

  If this is used with the zsh-nvm oh-my-zsh's plugin, do not enable NVM_AUTO_USE.
