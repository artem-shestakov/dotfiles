# Ansible collection to fist setup pc 
Collection roles to setup new PC (only Ubuntu family OS).

## Roles
**zsh**
* Install Zsh
* Setup Zsh: install "Oh my zsh" and plugins
> If playbook user is not defined and system has not $USER variable this role will setup zsh as default shell to root.

**to do...**

## Vars
| Role | Name | Description | Default |
| ---- | ---- | ----------- | ------- |
| Zsh | zsh_oh_my_plugins | List of "Oh My Zsh" [plugins](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins). If you install plugin from git, add it here too | []
| Zsh | zsh_oh_my_git_plugins | List of plugins from git. Every element is dictionary `{"name": plugin_name, "url": "git url"}` | []
| Zsh | zsh_path | Path to your oh-my-zsh installation | $HOME/.oh-my-zsh
| Zsh | zsh_theme | Theme of zsh | robbyrussell

