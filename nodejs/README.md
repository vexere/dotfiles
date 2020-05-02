# nvm & nodejs
To install nvm & nodejs goto dotfiles folder, type `./install_standalone.sh nvm`.

This package use zsh plugin 

# Introduction to npm alias
Prefix for `npm` alias is `n`. 
You are also welcome to use another `npm` prefix easily by changing `$NPM_ALIAS_PREFIX` variable in `npmalias` file.

You are also welcome to override npm aliases by modifying `npmalias` file to unset aliases or adding another aliases.

# Supported npm aliases
 Alias | Explanation |
| -- | -- |
| `ni` | `npm install` |
| `nid` | `npm install --save-dev` : install module for development purpose (build / test purpose) |
| `nig` | `npm install -g` : install module globally |
| `nr` | `npm run-script` |
| `nt` | `npm test` |
| `nit` | `npm install && npm test` |
| `nis` | `npm install && npm start` |
| `nits` | `npm install && npm test && npm start` |
| `ns` | `npm start` |
| `nlk` | `npm link` |
| `nw` | `npm run watch` |


# Roadmap
- [x] Add npm aliases
- [] Add npm completion
- [ ] Add `yarn` aliases

# Author
Author: <Long Luong> longbkit@gmail.com
Co-founder & CTO @ VeXeRe - the largest intercity bus ticket booking platform in Vietnam, also largest SaaS for bus operators.