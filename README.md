# .dotfiles
Repository containing my personal .dotfiles configurations, making it easy to set-up and synchronize 
my developer environment across machines. This set-up is hugely inspired by the [**TechDufus**][2] dotfiles 
set-up which can be found [**here**][2]. Basically most concepts and config is copied from his repo 
and modified / tweaked / stripped to my own liking. The goal is to provide a fully automated and maintainable
`Ubuntu` development environment that works seamlessly on both WSL (Windows Subsystem for Linux) and 
standard Ubuntu installations.

# Ansible
A huge part of the set-up makes use of [**Ansible**][3] (first run of the dotfiles script it will install Ansible itself).


# Installation
This script will install Ansible, synchronize the git repo, and run the Ansible playbook. After the first run the script
will be added to the `$PATH` so that from then on it can always be ran via `dotfiles`.

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ramonvermeulen/dotfiles/main/bin/dotfiles)"
```

# Updates
To update your environment run the `dotfiles` command in your shell:

```bash
dotfiles
```

This will handle the following tasks:

- Verify Ansible is up-to-date
- Generate SSH keys and add to `~/.ssh/authorized_keys`
- Clone this repository locally to `~/.dotfiles`
- Verify any `ansible-galaxy` plugins are updated
- Run this playbook with the values in `~/.config/dotfiles/group_vars/all.yaml`

This `dotfiles` command is available to you after the first use of this repo, as it adds this repo's `bin` directory to your path, allowing you to call `dotfiles` from anywhere.

Any flags or arguments you pass to the `dotfiles` command are passed as-is to the `ansible-playbook` command.

For Example: Running the tmux tag with verbosity
```bash
dotfiles -t btop -vvv
```

### vault.secret

The `vault.secret` file allows you to encrypt values with `Ansible vault` and store them securely in source control. Create a file located at `~/.config/dotfiles/vault.secret` with a secure password in it.

```bash
vim ~/.ansible-vault/vault.secret
```

To then encrypt values with your vault password use the following:

```bash
$ ansible-vault encrypt_string --vault-password-file $HOME/.ansible-vault/vault.secret "mynewsecret" --name "MY_SECRET_VAR"
$ cat myfile.conf | ansible-vault encrypt_string --vault-password-file $HOME/.ansible-vault/vault.secret --stdin-name "myfile"
```

> NOTE: This file will automatically be detected by the playbook when running `dotfiles` command to decrypt values. Read more on Ansible Vault [**here**][4].

<!-- These are the reference links used in this document -->
[1]: https://github.com/TechDufus/
[2]: https://github.com/TechDufus/dotfiles
[3]: https://github.com/ansible/ansible
[4]: https://docs.ansible.com/ansible/latest/user_guide/vault.html
