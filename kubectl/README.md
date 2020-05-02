# Introduction to kubectl alias
We chose `k` as alias prefix, in case there is conflict you may want to try to change `KUBECTL_ALIAS_PREFIX` in `kubectlalias` file to `kk` or `kb`

This alias is best used with fzf installed so you can enjoy fuzzy selection features across kubernetes contexts (clusters), pods, deployments, services, secrets, configmaps, nodes, ...

# GCloud alias table
| Alias | Explanation |
| -- | -- |
| `k` | kubectl |
| `ktop` or `kk` | k9s - a very nice and powerful interactive pod viewer, similar to htop tool for process that why the name `ktop` |
| `ksc` | Switch context / switch cluster |
| `ksn` | Switch namespace |
| `kgd` | Choose deployments and describe selected deployment |
| `ked` | Choose deployments and hot edit selected deployment |
| `kgi` | Choose ingress config and describe selected ingress |
| `kei` | Choose ingress config and hot edit selected ingress |
| `kgn` | Choose nodes and describe selected node |
| `kgs` | Choose services and describe selected service |
| `kes` | Choose services and hot edit selected service  |
| `kgp` | Choose pods and describe selected pod |
| `kep` | Choose pods and hot edit selected pod |
| `kgscr` | Choose secrets and describe selected secret |
| `kescr` | Choose secrets and hot edit selected secret |
| `kgcm` | Choose configmaps and describe selected configmap |
| `kecm` | Choose configmaps and hot edit selected configmap |


# TBD: insert gif images