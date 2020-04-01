# Ansible

Ansible is a tool that automates system administration, such as creating users, installing applications, monitoring connections, etc.


## Preflight

Verify Ansible playbook version is >= 2.5 and is using python >= 3.0

    ansible-playbook --version 

Verify Ansible can connect to all our hosts and run an ad hoc command:

    ansible all -i hosts.yml -a uptime


### Troubleshooting

If you get the error "Permission denied (publickey)" and you are using a
custom SSH key, then you must tell Ansible the path of the custom SSH key.
One way is to edit your SSH config file (typically `~/.ssh/config) and add
a new host section such as:

```ssh
Host www.example.com
User alice
HostName www.example.com
IdentityFile ~/.ssh/custom_ssh_key
```

If Ansible is not using python3, then install it, possibly as root:

    sudo su -
    source /etc/environment
    pip3 install ansible

If yamllint is not available, then install it:

    pip3 install yamllint


## Starter examples

Example to check that everything works:

    ansible-playbook --check -i hosts.yml playbooks/example.yml

Or if you want to use paramiko:

    ansible-playbook --check -i hosts.yml -c paramiko playbooks/example.yml

What the command does:

* `ansible-playbook` runs a playbook of tasks
* `--check` does a dry run
* `-i hosts` loads our inventory hosts file
* `-c paramiko` connects using the SSH Paramiko code
* `playbooks/cdn.yml` loads our content delivery network YAML.
