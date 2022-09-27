# ansible-pi

## Sources
While not a direct fork of [`hadoop-ansible`](https://github.com/mhdzy/hadoop-ansible), this repository does borrow code and structure from it.

## Overview

directories:
 * `common/` contains wrapper plays for frequent commands
 * `hosts/` contains an Ansible hosts file
 * `roles/` contains roles for
   * `hadoop`
   * `hive` todo
   * `init`
   * `java`
   * `kafka` todo
   * `spark` 
 * `tests/` scripts to test Ansible hosts
 * `tmp/`
 * `vars/` variables for each role

## Usage

Configure Cluster hosts in `hosts/`. Ensure variables in `vars/` are updated to reflect the hostnames and static IPs of the nodes. 

To test if all hosts are online, run:

```
ansible-playbook common/ping.yml
```

Modify the `all.yml`, `master.yml`, or `workers.yml` scripts to contain the roles required for installation. For the first install, all roles will be needed.

Each role has a `tasks/main.yml` file which controls which tasks the role will execute. Modify this file for each role to fit your needs.

Some roles have files in their `templates/` folder, which are used to automate insertion of variables, or programatically assemble a file using variables.

Each role has a `vars/*.yml` file containing all the variables it needs. Cross-role variable references are unchecked; all vars files are included in each playbook. All variable names are unique across all vars files. 

Once configured, run the playbooks with any one of:

```
ansible-playbook all.yml
ansible-playbook master.yml
ansible-playbook workers.yml
```

## License

Distributed under the GPL-3 license with source code from [pippozq](https://github.com/pippozq/hadoop-ansible).
